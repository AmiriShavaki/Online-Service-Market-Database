/*------------------------Functions--------------------------- */

go
create function most_satisifing_service_provider(@clientUserName varchar(50)) returns table as
return (
select p.service_provider, max(rating) as max_rating_achieved
from
(((finalized_order inner join initial_order on initial_order.id = initial_order_id) 
	inner join picks p on initial_order.id = p.initial_order_id) 
	inner join estimate_price e on p.initial_order_id = e.initial_order_id and 
	p.service_provider = e.service_provider)
where p.client = @clientUserName
group by p.service_provider
);
go

-- for example
select top 1 * from most_satisifing_service_provider('mot1998_1234') 
order by max_rating_achieved desc;
select top 1 * from most_satisifing_service_provider('SMR') 
order by max_rating_achieved desc;
select top 1 * from most_satisifing_service_provider('Sajj_R') 
order by max_rating_achieved desc;
select top 1 * from most_satisifing_service_provider('MeliNo') 
order by max_rating_achieved desc;

drop function most_satisifing_service_provider;

go
create function show_all_of_clients(@serviceProviderUserName varchar(50)) returns table as
return (
select distinct picks.initial_order_estimation_price_request as client_username
from picks
where picks.service_provider = @serviceProviderUserName
);
go

-- for example
select * from show_all_of_clients('SamanMR'); 
select * from show_all_of_clients('MahdiASh');
select * from show_all_of_clients('MHashemi1379');
select * from show_all_of_clients('Mohsen_Hosseini');

drop function show_all_of_clients;

go
create function show_all_services(@managerLastName varchar(50)) returns table as
return (
select service_names
from provides, sp1, company, company_manager
where service_provider_username = sp1.username and sp1.username = company.username and 
	company.username = company_username and last_name = @managerLastName
);
go

-- for example
select * from show_all_services('Shoeibi');
select * from show_all_services('Ziaee');
select * from show_all_services('Rahmani');

drop function show_all_services;
