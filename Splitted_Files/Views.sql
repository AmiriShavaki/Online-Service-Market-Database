/*------------------------Views--------------------------- */

go
create view dbo.car_repairmans(username, passwrd, start_year, location_range_of_service, service_provider_username, c_service_name)
with schemabinding as
select username, passwrd, start_year, location_range_of_service, service_provider_username, c_service_name
from dbo.sp1 ,dbo.provides,dbo.car_service,dbo.s_service
where dbo.sp1.username=dbo.provides.service_provider_username
and dbo.provides.service_names=dbo.s_service.s_name
and dbo.s_service.s_name=dbo.car_service.c_service_name
go

create unique clustered index idx_car_repairmans on dbo.car_repairmans(username, c_service_name);

select * from dbo.car_repairmans;

drop view dbo.car_repairmans;

go
create view dbo.service_providers_phone_numbers(service_names,service_provider_username,phone_number)
with schemabinding as
select service_names,service_provider_username,phone_number
from dbo.provides, dbo.sp1, dbo.sp3
where service_provider_username=dbo.sp1.username and dbo.sp3.username = dbo.sp1.username
go

create unique clustered index idx_car_repairmans on dbo.service_providers_phone_numbers(service_names,service_provider_username);

select * from dbo.service_providers_phone_numbers;

drop view dbo.service_providers_phone_numbers;

go
create view dbo.electric_service_and_devices(device_name, electric_service)
with schemabinding as
select device_name, electric_service from dbo.electric_service inner join dbo.device 
on dbo.device.electric_service=dbo.electric_service.e_service_name
go

create unique clustered index idx_electric_service_and_devices on 
dbo.electric_service_and_devices(device_name);

select * from dbo.electric_service_and_devices;

drop view dbo.electric_service_and_devices;

go
create view service_provider_profiles(username, address_on_social_networks, license_number, avg_rating,
										avg_price, number_of_completed_services) as
select p.service_provider, sp2.address_on_social_networks, sp4.licence_number,
	avg(cast(rating as float)), avg(price), count(p.service_provider)
from ((((finalized_order inner join initial_order on initial_order.id = initial_order_id) 
	inner join picks p on initial_order.id = p.initial_order_id) 
	inner join estimate_price e on p.initial_order_id = e.initial_order_id and p.service_provider = e.service_provider)
	left join sp2 on sp2.username = p.service_provider) left join sp4 on sp4.username = p.service_provider
group by p.service_provider, sp2.address_on_social_networks, sp4.licence_number
go

select * from service_provider_profiles order by avg_rating desc, avg_price;

drop view service_provider_profiles;

go
create view client_past_orders_insight(username, first_name, last_name, avg_given_rating, total_spent_price, 
										number_of_completed_requested_services) as
select c.username, c.first_name, c.last_name, avg(cast(rating as float)), sum(price), count(f.id)
from ((finalized_order f inner join initial_order on initial_order.id = initial_order_id) 
	inner join cl1 c on initial_order.estimation_price_request = c.username)
group by c.username, c.first_name, c.last_name
go 

select * from client_past_orders_insight order by total_spent_price desc;

drop view client_past_orders_insight;

go
create view show_all_username_passwords(username, passwrd) as
select username, passwrd from sp1 union select username, passwrd from cl1
go

select * from show_all_username_passwords;

drop view show_all_username_passwords;




go
create view long_term_contract_serviceproviders_income_avg_vs_total_income_avg(register_time,minuatesUntilEnd,client,service_provider,phone_number,licence_of_serivce_provider,avgServiceProviderIncomeAgainstTotal)
as
select register_time,priod,client,s1.username,phone_number,licence_number,avg(estimated_price)/tb2.total_estimated_price
from (((long_term_contract l inner join sp1 as s1 on l.service_provider=s1.username)
inner join estimate_price ep on ep.service_provider=s1.username)
inner join sp3 as s3 on s3.username=s1.username)
inner join sp4 as s4 on s4.username = s1.username
,(select avg(estimated_price) as total_estimated_price from estimate_price) as tb2
group by register_time,priod,client,s1.username,phone_number,licence_number,total_estimated_price
go

select * from long_term_contract_serviceproviders_income_avg_vs_total_income_avg

drop view long_term_contract_serviceproviders_income_avg_vs_total_income_avg;



/*tedad long_term_contract_haye_emsal_be_kol_sal ha*/

go
create  view sp_with_most_finalized_order_vs_total(nesbat_longTermContract_haye_emsal_be_kol)
as 
select cast(tb1.x1 as float)/cast(tb2.x2 as float) from
(select count(*) as x1
from long_term_contract
where Year(register_time)=Year(GETDATE())) as tb1
,(select count(*) as x2 from long_term_contract) as tb2
go

select * from sp_with_most_finalized_order_vs_total;

drop view sp_with_most_finalized_order_vs_total;


/* 2 service provider haie ke bishtarin order ra darand che avg(rating) darand*/

go
create view most_wanted_serviceProviders_rate(avg_rating_of_most_wanted_serive_providers)
as 
select avg(avg_rate) from 
(select top 2 sp1.username,avg(finalized_order.rating) as avg_rate from sp1,finalized_order,initial_order,estimate_price
where finalized_order.initial_order_id=initial_order.id
and initial_order.id=estimate_price.initial_order_id
and estimate_price.service_provider=sp1.username
group by sp1.username
order by count(*)) as tb1
go

select * from most_wanted_serviceProviders_rate;
drop view most_wanted_serviceProviders_rate;


/*price va rate sp hayie ke finalized order haye bishtari darand*/

go
create view price_rate_service_providers(Service_provider,avg_Price,avg_rate)
as 
select sp1.username, avg(finalized_order.price),avg(finalized_order.rating)
from picks,initial_order,sp1,estimate_price,finalized_order
where finalized_order.initial_order_id=initial_order.id
and initial_order.id=estimate_price.initial_order_id
and estimate_price.service_provider=sp1.username
and sp1.username = picks.service_provider
group by sp1.username
go

select * from price_rate_service_providers;
drop view price_rate_service_providers;


/*daramad service provider ha az order ha ta be inja sort shode*/
go 
create view income_service_provider(service_provider,incomeUntilNow)
as
select top 5 sp1.username,sum(finalized_order.price)
from sp1,finalized_order,initial_order,picks
where sp1.username=picks.service_provider
and picks.initial_order_id=initial_order.id
and initial_order.id=finalized_order.initial_order_id
group by sp1.username
order by sum(finalized_order.price) desc;
go

select * from income_service_provider;
drop view income_service_provider;


/*client hayie ke bishtarin kharid ra be lahaz hazine anjam dadan*/
go
create view bishtarin_kharid_clinet(client,price)
as
select top 2 cl1.username,sum(finalized_order.price)
from cl1,picks,initial_order,finalized_order
where cl1.username=picks.client
and picks.initial_order_id=initial_order.id
and initial_order.id=finalized_order.initial_order_id
group by cl1.username
order by sum(finalized_order.price) desc;
go

select * from bishtarin_kharid_clinet;
drop view bishtarin_kharid_clinet;