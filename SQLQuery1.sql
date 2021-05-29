/*create tables*/

create table long_term_contract
(
	register_time datetime not null,
	priod         bigint/*? for min*/     not null,/*period is reserved by sql.*//*what is a good datatype for period?*/
	contract_id   int      identity,
	client        nvarchar not null,
	service_provider nvarchar not null,
	primary key (contract_id),
	foreign key(client) references client(username),/*used another table from another part------high possibility of error*/
	foreign key(service_provider) references service_provider(username)/*used another table from another part------high possibility of error*/
);


create table provides
(
	service_names nvarchar not null,/*service_name is a reserved word.*/
	service_provider_username nvarchar not null,
	foreign key (service_names) references s_service(s_name),/*service and name is reserved by sql*//*used another table from another part------high possibility of error*/
	foreign key(service_provider_username) references service_provider(username)/*used another table from another part------high possibility of error*/
);

create table s_service
(
	s_name nvarchar not null,
	primary key(s_name)
);

create table car_service
(
	c_service_name nvarchar not null unique,
	primary key(c_service_name),
	foreign key(c_service_name) references s_service(s_name)
);

create table vehicle
(
	vehicle_name nvarchar not null unique,
	car_service nvarchar not null unique,
	primary key(vehicle_name,car_service),
	foreign key(car_service) references car_service(c_service_name)
);

create table non_electric_kitchen_service
(
	k_service_name nvarchar not null unique,
	primary key(k_service_name),
	foreign key (k_service_name) references s_service(s_name)
);

create table home_appliances
(
	appliances_name nvarchar not null unique,
	non_electric_kitchen_service nvarchar not null unique,
	primary key(appliances_name,non_electric_kitchen_service),
	foreign key(non_electric_kitchen_service) references non_electric_kitchen_service(k_service_name)
);

create table electric_service
(
	e_service_name nvarchar not null unique,
	primary key(e_service_name),
	foreign key(e_service_name) references s_service(s_name)
);

create table device
(
	device_name nvarchar not null unique,
	electric_service nvarchar not null unique,
	primary key(electric_service,device_name),
	foreign key(electric_service) references electric_service(e_service_name)
);

create table cleaning_service
(
	clean_service_name nvarchar not null unique,
	approximate_area_value nvarchar not null unique,/*or int ?*/
	primary key (clean_service_name),
	foreign key (clean_service_name) references s_service(s_name),
);

create table position
(
	position_name nvarchar not null unique,
	cleaning_service nvarchar not null unique,
	primary key(position_name,cleaning_service),
	foreign key(cleaning_service) references cleaning_service(clean_service_name)
);


/*simple queries*/
select register_time,priod,client,service_provider
from long_term_contract;

select service_names,service_provider_username
from provides;

/*used another table from another part------high possibility of error---------*/
select service_names,service_provider_username,phone_number
from provides,service_provider
where service_provider_username=service_provider.username;

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

/*insertion to table*/

/*long term contracts*/
insert into long_term_contract(register_time,priod,client,service_provider)
values ('2008-10-29',12122121,'','');

insert into long_term_contract(register_time,priod,client,service_provider)
values ('2009-10-29',12145121,'','');

insert into long_term_contract(register_time,priod,client,service_provider)
values ('2008-11-29',12567212,'','');

insert into long_term_contract(register_time,priod,client,service_provider)
values ('2008-10-09',12898121,'','');

/*provides*/
insert into provides(service_names,service_provider_username)
values (N'تعمیر ماشین ایران خودرو','');

insert into provides(service_names,service_provider_username)
values (N'تعمیر تلویزیون ','');

insert into provides(service_names,service_provider_username)
values (N'تعمیر  آب گرم کن','');

insert into provides(service_names,service_provider_username)
values (N'تعمیر کابینت','');

insert into provides(service_names,service_provider_username)
values (N'تعمیر ماشین ایران خودرو','');

/*services*/


/*car_service*/
insert into car_service(c_service_name)
values (N'تعمیر ماشین ایران خودرو');

insert into car_service(c_service_name)
values (N'تعمیر ماشین رنو');

insert into car_service(c_service_name)
values (N'تعمیر ماشین پراید');

insert into car_service(c_service_name)
values (N'تعمیر ماشین پژو');

/*vehicle*/
insert into vehicle(vehicle_name,car_service)
values (N'تندر',N'تعمیر ماشین ایران خودرو');

insert into vehicle(vehicle_name,car_service)
values (N'مگان',N'تعمیر ماشین رنو');

insert into vehicle(vehicle_name,car_service)
values (N'تیبا',N'تعمیر ماشین پراید');

insert into vehicle(vehicle_name,car_service)
values (N'206',N'تعمیر ماشین پژو');

update long_term_contract
set register_time = GETDATE()
where year(register_time)='2008';

update vehicle
set vehicle_name='207'
where vehicle_name='206'

/*this update query have to use as a function in another query*/
update provides
set service_provider_username=''
where service_provider_username='';

drop table long_term_contract;
drop table provides;
drop table s_service;
drop table car_service;
drop table vehicle;
drop table non_electric_kitchen_service;
drop table home_appliances;
drop table electric_service;
drop table device;
drop table cleaning_service;
drop table position;