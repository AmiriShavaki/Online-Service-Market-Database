
create table service_provider(
	username varchar(50) not null,
	passwrd varchar(50) not null,
	address_on_social_networks varchar(50),
	phone_number varchar(15),
	licence_number varchar(15),
	start_year date,
	location_range_of_service nvarchar(100),
	primary key (username)
);

insert into service_provider (username, passwrd, address_on_social_networks, phone_number, licence_number, start_year, 
								location_range_of_service)
		values  ('Mohsen_Hosseini', 'pAssword4', 'MohHoss', '09141468677', '723986459', '2015-12-17', 'Pasdaran, Azadi, Navvab');
			
insert into service_provider (username, passwrd, address_on_social_networks, phone_number, location_range_of_service)
		values  ('MahdiASh', '12344321', 'MA1379', '09222702476', 'Jamalzadeh, Shahr e Rey, Tajrish, Azadegan, Mehrabad');

insert into service_provider (username, passwrd, phone_number, location_range_of_service)
		values  ('SamanMR', '87654321', '09105983290', 'Lalehzar, Naziabad, Yaftabad, Meydan Resalat, Piroozi');

insert into service_provider (username, passwrd, licence_number, start_year)
		values  ('MHashemi1379', '13792000', '3452134', '2013-5-4');

insert into service_provider (username, passwrd, address_on_social_networks, phone_number)
		values ('Ayandeh_Ziba', 'DontHackMePls', 'AyandeRoshanAstDDD', '02144124124')

insert into service_provider (username, passwrd, phone_number, location_range_of_service)
		values ('PorkaranePortalash', '12345678', '0212323233', 'Pasdaran, Monirye, Tajrish, Darvazeh ghaar')

insert into service_provider (username, passwrd, phone_number)
		values ('NoandishaneSaee', '14253462', '+989123123132');

select * from service_provider;/*---------------------------------------------------------------------*/


create table gallery(
	photo_dir varchar(300) not null,
	photo_id int identity(10000, 1),
	username varchar(50) not null,
	primary key (photo_id, username),
	foreign key (username) references service_provider(username)
);

create table specialist(
	first_name nvarchar(100),
	last_name nvarchar(100) not null,
	gender varchar(6),
	age int,
	degree_of_education varchar(100),
	username varchar(50) not null,
	primary key (username),
	foreign key (username) references service_provider(username)
);

insert into specialist (first_name, last_name, gender, age, degree_of_education, username)
	values ('Mohsen', 'Hosseini', 'male', 92, 'Master of Electronic Engineering from Iran University of Science and Technology',
			'Mohsen_Hosseini');

insert into specialist (last_name, gender, age, username)
	values ('Amiri Shavaki', 'male', 21, 'MahdiASh');

insert into specialist (first_name, last_name, gender, age, username)
	values ('Saman', 'Mohammadi Raouf', 'male', 21, 'SamanMR');

insert into specialist (first_name, last_name, gender, degree_of_education, username)
	values ('Maryam', 'Hashemi', 'female', 'Bachelors of Computer Engineering from Sharif University of Technology', 'MHashemi1379');

select * from specialist;
delete from specialist where gender = 'female';
select * from specialist;

create table company(
	/*website varchar(100),*/
	username varchar(50) not null,
	primary key (username),
	foreign key (username) references service_provider(username)
);

insert into company (username)
	values ('Ayandeh_Ziba');

insert into company (username)
	values ('PorkaranePortalash');

insert into company (username)
	values ('NoandishaneSaee');

select * from company;
alter table company add website varchar(100);
select * from company;
update company set website = 'www.FardasazanAyandehZiba.ir' where username = 'Ayandeh_Ziba';
select * from company;

create table company_manager(
	first_name nvarchar(100),
	last_name nvarchar(100) not null,
	company_username varchar(50) not null,
	primary key (company_username),
	foreign key (company_username) references company(username)
);

insert into company_manager (first_name, last_name, company_username)
	values ('Hossein', 'Rahmani', 'Ayandeh_Ziba');

insert into company_manager (first_name, last_name, company_username)
	values ('Sina', 'Ziaee', 'PorkaranePortalash');

insert into company_manager (last_name, company_username)
	values ('Shoeibi', 'NoandishaneSaee');

select * from company_manager;/*--------------------------------------------------*/
create table client(
	first_name nvarchar(100),
	last_name nvarchar(100) not null,
	phone_number varchar(15),
	wallet_value money not null,
	username varchar(50) not null,
	passwrd varchar(50) not null,
	primary key(username)
);

insert into client (first_name, last_name, phone_number, wallet_value, username, passwrd)
	values ('Melika', 'Nobakhtian', '+989131231231', 100.2, 'MeliNo', 'perspolis');

insert into client (first_name, last_name, wallet_value, username, passwrd)
	values ('Seyed Mahdi', 'Razavi', 3124.123, 'SMR', 'AlAla1234');

insert into client (last_name, phone_number, wallet_value, username, passwrd)
	values ('Motevaseli', '+989123123456', 234.23, 'mot1998_1234', 'AStrongPassword');

insert into client (last_name, phone_number, wallet_value, username, passwrd)
	values ('Ramezani', '+9891249772309', 0, 'Sajj_R', 'Pass1234');

select * from client;/*-----------------------------------------*/

create table initial_order(
	description_of_requested_work nvarchar(2000) not null,
	estimation_price_request varchar(50) not null,
	id int identity(10000, 1) not null,
	primary key (id, estimation_price_request),
	foreign key (estimation_price_request) references client(username)
);

create table estimate_price(
	initial_order_id int not null,
	initial_order_estimation_price_request varchar(50) not null,
	service_provider varchar(50) not null,
	estimated_price money not null,
	primary key (initial_order_id, initial_order_estimation_price_request, service_provider, estimated_price),
	foreign key (service_provider) references service_provider(username),
	foreign key (initial_order_id, initial_order_estimation_price_request) references initial_order(id, estimation_price_request)
);

create table finalized_order(
	client_comment nvarchar(2000),
	rating int not null,
	price money not null,
	initial_order_id int not null,
	initial_order_estimation_price_request varchar(50) not null,
	id int identity(10000, 1),
	primary key(initial_order_id, initial_order_estimation_price_request, id),
	foreign key (initial_order_id, initial_order_estimation_price_request) references initial_order(id, estimation_price_request)
);

create table picks(
	client varchar(50) not null,
	initial_order_id int not null,
	initial_order_estimation_price_request varchar(50) not null,
	service_provider varchar(50) not null,
	primary key(client, initial_order_id, initial_order_estimation_price_request, service_provider),
	foreign key (client) references client(username),
	foreign key (initial_order_id, initial_order_estimation_price_request) references initial_order(id, estimation_price_request),
	foreign key (service_provider) references service_provider(username)
);

/*part_2*//*--------------------------------create table-----------------------------------*/
create table long_term_contract
(
	register_time datetime not null,
	priod         bigint/*? for min*/     not null,/*period is reserved by sql.*//*what is a good datatype for period?*/
	contract_id   int      identity,
	client        varchar(50) not null,
	service_provider varchar(50) not null,
	primary key (contract_id),
	foreign key(client) references client(username),/*used another table from another part------high possibility of error*/
	foreign key(service_provider) references service_provider(username)/*used another table from another part------high possibility of error*/
);

create table s_service
(
	s_name nvarchar(100) not null unique,
	primary key(s_name)
);

create table provides
(
	service_names nvarchar(100) not null,/*service_name is a reserved word.*/
	service_provider_username varchar(50) not null,
	foreign key (service_names) references s_service(s_name),/*service and name is reserved by sql*//*used another table from another part------high possibility of error*/
	foreign key(service_provider_username) references service_provider(username)/*used another table from another part------high possibility of error*/
);



create table car_service
(
	c_service_name nvarchar(100) not null unique,
	primary key(c_service_name),
	foreign key(c_service_name) references s_service(s_name)
);

create table vehicle
(
	vehicle_name nvarchar(100) not null unique,
	car_service nvarchar(100) not null unique,
	primary key(vehicle_name,car_service),
	foreign key(car_service) references car_service(c_service_name)
);

create table non_electric_kitchen_service
(
	k_service_name nvarchar(100) not null unique,
	primary key(k_service_name),
	foreign key (k_service_name) references s_service(s_name)
);

create table home_appliances
(
	appliances_name nvarchar(100) not null unique,
	non_electric_kitchen_service nvarchar(100) not null unique,
	primary key(appliances_name,non_electric_kitchen_service),
	foreign key(non_electric_kitchen_service) references non_electric_kitchen_service(k_service_name)
);

create table electric_service
(
	e_service_name nvarchar(100) not null unique,
	primary key(e_service_name),
	foreign key(e_service_name) references s_service(s_name)
);

create table device
(
	device_name nvarchar(100) not null unique,
	electric_service nvarchar(100) not null unique,
	primary key(electric_service,device_name),
	foreign key(electric_service) references electric_service(e_service_name)
);

create table cleaning_service
(
	clean_service_name nvarchar(100) not null unique,
	approximate_area_value nvarchar(100) not null unique,/*or int ?*/
	primary key (clean_service_name),
	foreign key (clean_service_name) references s_service(s_name),
);

create table position
(
	position_name nvarchar(100) not null unique,
	cleaning_service nvarchar(100) not null unique,
	primary key(position_name,cleaning_service),
	foreign key(cleaning_service) references cleaning_service(clean_service_name)
);

/*----------------------------------insertion to table-----------------------------------*/

/*long term contracts*/
insert into long_term_contract(register_time,priod,client,service_provider)
values ('2008-10-29',12122121,'MeliNo','Mohsen_Hosseini');

insert into long_term_contract(register_time,priod,client,service_provider)
values ('2009-10-29',12145121,'SMR','MahdiASh');

insert into long_term_contract(register_time,priod,client,service_provider)
values ('2008-11-29',12567212,'mot1998_1234','SamanMR');

insert into long_term_contract(register_time,priod,client,service_provider)
values ('2008-10-09',12898121,'Sajj_R','MHashemi1379');

select * from long_term_contract;


/*services*/
insert into s_service(s_name)
values (N'تعمیر ماشین ایران خودرو');

insert into s_service(s_name)
values (N'تعمیر ماشین رنو');

insert into s_service(s_name)
values (N'تعمیر ماشین پراید');

insert into s_service(s_name)
values (N'تعمیر ماشین پژو');

insert into s_service(s_name)
values (N'تعمیر کابینت');

insert into s_service(s_name)
values (N'تعمیر سینک');

insert into s_service(s_name)
values (N'تعمیر لوله آشپزخونه');

insert into s_service(s_name)
values (N'تعمیرات موبایل');

insert into s_service(s_name)
values (N'تعمیرات کامپیوتر');

insert into s_service(s_name)
values (N'تعمیرات کنسول بازی');

insert into s_service(s_name)
values (N'تعمیر تلویزیون');

insert into s_service(s_name)
values (N'شستن پنجره');

insert into s_service(s_name)
values (N'تعمیرات لپتاپ');

insert into s_service(s_name)
values (N'نظافت کف منزل');

insert into s_service(s_name)
values (N'تعمیر  آب گرم کن');



/*provides*/
insert into provides(service_names,service_provider_username)
values (N'تعمیر ماشین ایران خودرو','Mohsen_Hosseini');

insert into provides(service_names,service_provider_username)
values (N'تعمیر تلویزیون ','MahdiASh');

insert into provides(service_names,service_provider_username)
values (N'تعمیر  آب گرم کن','SamanMR');

insert into provides(service_names,service_provider_username)
values (N'تعمیر کابینت','MHashemi1379');

insert into provides(service_names,service_provider_username)
values (N'تعمیر ماشین ایران خودرو','Mohsen_Hosseini');


select * from provides;



/*car_service*/
insert into car_service(c_service_name)
values (N'تعمیر ماشین ایران خودرو');

insert into car_service(c_service_name)
values (N'تعمیر ماشین رنو');

insert into car_service(c_service_name)
values (N'تعمیر ماشین پراید');

insert into car_service(c_service_name)
values (N'تعمیر ماشین پژو');


select * from car_service;
/*vehicle*/
insert into vehicle(vehicle_name,car_service)
values (N'تندر',N'تعمیر ماشین ایران خودرو');

insert into vehicle(vehicle_name,car_service)
values (N'مگان',N'تعمیر ماشین رنو');

insert into vehicle(vehicle_name,car_service)
values (N'تیبا',N'تعمیر ماشین پراید');

insert into vehicle(vehicle_name,car_service)
values (N'206',N'تعمیر ماشین پژو');

select * from vehicle;
/*non_electric_kitchen_service*/
insert into non_electric_kitchen_service(k_service_name)
values(N'تعمیر کابینت');

insert into non_electric_kitchen_service(k_service_name)
values(N'تعمیر سینک');

insert into non_electric_kitchen_service(k_service_name)
values(N'تعمیر لوله آشپزخونه');


select * from non_electric_kitchen_service;

insert into home_appliances(appliances_name,non_electric_kitchen_service)
values(N'کابینت',N'تعمیر کابینت');

insert into home_appliances(appliances_name,non_electric_kitchen_service)
values(N'سینک ظرف شویی',N'تعمیر سینک');

insert into home_appliances(appliances_name,non_electric_kitchen_service)
values(N'لوله های آب در آشپزخونه',N'تعمیر لوله آشپزخونه');

select * from home_appliances;

insert into electric_service(e_service_name)
values(N'تعمیرات موبایل');

insert into electric_service(e_service_name)
values(N'تعمیرات کامپیوتر');

insert into electric_service(e_service_name)
values(N'تعمیرات کنسول بازی');

insert into electric_service(e_service_name)
values(N'تعمیر تلویزیون ');

select * from electric_service;

insert into device(device_name,electric_service)
values(N'S10',N'تعمیرات موبایل');

/*insert into device(device_name,electric_service)
values(N'S9',N'تعمیرات موبایل');*//*------------------------why error??-----------------------------------*/

/*insert into device(device_name,electric_service)
values(N'S8',N'تعمیرات موبایل');*//*-------------------------why error??----------------------------------*/

insert into device(device_name,electric_service)
values(N'ps4',N'تعمیرات کنسول بازی');

insert into device(device_name,electric_service)
values(N'LG7s',N'تعمیر تلویزیون ');

/*insert into device(device_name,electric_service)
values(N'ideapad 330s',N'تعمیرات لپتاپ');*//*-------------------------why error??--------------------------------*/


select * from device;

insert into cleaning_service(clean_service_name,approximate_area_value)
values(N'شستن پنجره',N'ده تا دو در دو')

insert into cleaning_service(clean_service_name,approximate_area_value)
values(N'نظافت کف منزل',N'60m^2');

select * from cleaning_service;

insert into position(position_name,cleaning_service)
values(N'پنجره های اتاق خواب پذیرایی آشپزخونه',N'شستن پنجره');

insert into position(position_name,cleaning_service)
values(N'کف منزل',N'نظافت کف منزل');

select * from position;


/*--------------------------simple queries----------------------------------*/

select register_time,priod,client,service_provider
from long_term_contract;

select service_names,service_provider_username
from provides;


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



/*---------------------------update queries--------------------------------*/
update long_term_contract
set register_time = GETDATE()
where year(register_time)='2008';

select * from long_term_contract;

update vehicle
set vehicle_name='207'
where vehicle_name='206'

select * from vehicle;

/*this update query have to use as a function in another query*/
update provides
set service_provider_username='Mohsen_Hosseini'
where service_provider_username='SamanMR';

select * from provides;

/*update provides
set service_names=N'تعمیرات پکیج آب گرم کن'
where service_names=N'تعمیر  آب گرم کن';

update s_service,
set s_name = N'تعمیرات پکیج آب گرم کن'
where s_name=N'تعمیر  آب گرم کن';*//*how to make it ok????*/

select * from s_service;


update device
set device_name='Lenovo IdeaPad330s'
where device_name='ideapad 330s';

select * from device;


update device
set device_name='PlayStation5'
where device_name='ps4' AND electric_service=N'تعمیرات کنسول بازی';

select * from device;

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

/*-------------------delet from table ----------------------*/
delete from long_term_contract where service_provider='Mohsen_Hosseini';
select * from long_term_contract;

delete from s_service where s_name='تعمیر ماشین رنو';
select * from s_service;

delete from device where device_name='PlayStation5';
select * from device;
/*----------------------final simplq queries------------------------*/
select * from service_provider;
select * from gallery; 
select * from specialist;
select * from company;
select * from company_manager;
select * from finalized_order;
select * from initial_order;
select * from estimate_price;
select * from client;
select * from picks;
select * from long_term_contract;
select * from provides;
select * from s_service;
select * from car_service;
select * from vehicle;
select * from non_electric_kitchen_service;
select * from home_appliances;
select * from electric_service;
select * from device;
select * from cleaning_service;
select * from position;
/*------------------------drop table--------------------------- */


drop table long_term_contract;
drop table provides;
drop table picks;
drop table estimate_price;
drop table finalized_order;
drop table initial_order;
drop table client;
drop table gallery;
drop table specialist;
drop table company_manager;
drop table company;
drop table service_provider;
drop table vehicle;
drop table car_service;
drop table home_appliances;
drop table non_electric_kitchen_service;
drop table device;
drop table electric_service;
drop table position;
drop table cleaning_service;
drop table s_service;