/*---------alter---------*/
alter table position add position_area nvarchar(100);
select * from position;

update position set position_area=(select approximate_area_value from cleaning_service where position.cleaning_service=cleaning_service.clean_service_name);
select * from position;

--alter table s_service drop column kinfOfService;
alter table s_service add kindOfService nvarchar(100);

select * from s_service;

update s_service
set kindOfService = 'car_services'
where s_service.s_name in (select car_service.c_service_name from car_service);

select * from s_service;

update s_service
set kindOfService = 'non_electric_kitchen_service'
where s_service.s_name in (select k_service_name from non_electric_kitchen_service);

select * from s_service;

update s_service
set kindOfService = 'electric_service'
where s_service.s_name in (select e_service_name from electric_service);

select * from s_service;

update s_service
set kindOfService = 'cleaning_service'
where s_service.s_name in (select clean_service_name from cleaning_service);

select * from s_service;
