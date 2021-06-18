/*--------------------------simple select queries----------------------------------*/

select register_time,priod,client,service_provider
from long_term_contract;

select service_names,service_provider_username
from provides;

select service_names,service_provider_username,phone_number
from provides, sp1, sp3
where service_provider_username=sp1.username and sp3.username = sp1.username;

select * from s_service;

select vehicle_name
from car_service,vehicle
where car_service=car_service.c_service_name;

select k_service_name
from non_electric_kitchen_service;

select appliances_name
from home_appliances,non_electric_kitchen_service
where non_electric_kitchen_service.k_service_name=home_appliances.non_electric_kitchen_service;

select	*
from electric_service;

select device_name
from device,electric_service
where device.electric_service=electric_service.e_service_name;

select * 
from cleaning_service;

select position_name
from position,cleaning_service
where cleaning_service.clean_service_name=position.cleaning_service;
/*---------------------------complicated select queries-----------------------------------------------*/

select picks.initial_order_id, client, e1.estimated_price as expensive_picked_price, e2.estimated_price as lowest_proposed_price
from picks, estimate_price as e1, estimate_price as e2
where picks.service_provider = e1.service_provider and picks.initial_order_id = e1.initial_order_id and
	picks.initial_order_id = e2.initial_order_id and e1.estimated_price > e2.estimated_price;

select service_provider, count(service_provider) as Number_of_completed_services
from (finalized_order inner join initial_order on initial_order.id = initial_order_id) 
	inner join picks on initial_order.id = picks.initial_order_id
group by service_provider;

select p.service_provider, avg(price) as Average_Price
from ((finalized_order inner join initial_order on initial_order.id = initial_order_id) 
	inner join picks p on initial_order.id = p.initial_order_id) 
	inner join estimate_price e on p.initial_order_id = e.initial_order_id and p.service_provider = e.service_provider
group by p.service_provider;

select p.service_provider, avg(cast(rating as float)) as Average_Rating
from ((finalized_order inner join initial_order on initial_order.id = initial_order_id) 
	inner join picks p on initial_order.id = p.initial_order_id) 
	inner join estimate_price e on p.initial_order_id = e.initial_order_id and p.service_provider = e.service_provider
group by p.service_provider;

select * from sp1 inner join provides on sp1.username=provides.service_provider_username;

select * from car_service inner join vehicle on car_service.c_service_name=vehicle.car_service;

select * from non_electric_kitchen_service inner join home_appliances
on non_electric_kitchen_service.k_service_name=home_appliances.non_electric_kitchen_service
where k_service_name<>N'تعمیر سینک';

select * from electric_service inner join device on device.electric_service=electric_service.e_service_name;

select * from cleaning_service inner join position on cleaning_service.clean_service_name=position.cleaning_service;

select * from cl1
where wallet_value>(select avg(wallet_value) from cl1);

select * from sp1 ,provides,car_service,s_service
where sp1.username=provides.service_provider_username
and provides.service_names=s_service.s_name
and s_service.s_name=car_service.c_service_name;
