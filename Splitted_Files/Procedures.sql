go
create procedure find_lowest_price_of_estimated_prices @initial_order_id int
as
select min(estimated_price) as MinimumEstimated_price
from estimate_price,initial_order
where estimate_price.initial_order_id=initial_order.id
and initial_order.id= @initial_order_id
go

--examples
select *
from estimate_price,initial_order
where estimate_price.initial_order_id=initial_order.id;

exec find_lowest_price_of_estimated_prices @initial_order_id = 10000;
exec find_lowest_price_of_estimated_prices @initial_order_id = 10001;
exec find_lowest_price_of_estimated_prices @initial_order_id = 10002;
exec find_lowest_price_of_estimated_prices @initial_order_id = 10003;

drop procedure find_lowest_price_of_estimated_prices;


/*esm vehicle ro migirad va khoroji service haye mokhtalefi ke mishe rosh anjam 
mishavad ro khoroji mide*/
go
create procedure servicesForThisCar @vehicle_name nvarchar(100)
as
select * 
from vehicle
where vehicle.vehicle_name=@vehicle_name;
go

--examples
select * from vehicle;
exec servicesForThisCar @vehicle_name=N'سمند';
exec servicesForThisCar @vehicle_name='405';
exec servicesForThisCar @vehicle_name='2008';
exec servicesForThisCar @vehicle_name=N'تندر';

drop procedure servicesForThisCar;

go
create procedure darsad_carService_be_Service_ha
as
select cast(tb1.x1 as float)/cast(tb2.x2 as float)
from
(select count(*) as x1 from car_service) as tb1,
(select count(*) as x2 from s_service) as tb2
go


--example
select * from s_service;
select * from car_service
exec darsad_carService_be_Service_ha;

drop procedure darsad_carService_be_Service_ha;


/*esm service ro midim va mibinim che service provider hayie oon ro tamin mikonan*/
go 
create procedure service_providers_for_this_service @service_name nvarchar(100)
as
select sp1.username
from sp1,provides
where provides.service_provider_username=sp1.username
and provides.service_names=@service_name
go

--example
select * from provides

exec service_providers_for_this_service @service_name=N'تعمیر کابینت';
drop procedure service_providers_for_this_service;

