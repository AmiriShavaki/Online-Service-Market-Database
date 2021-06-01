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
		values  ('Mohsen_Hosseini', 'pAssword4', 'MohHoss', '09141468677', '723986459', '2015-12-17', 'Pasdaran, Azadi, Navvab'),
			('RezMosav', 'IndComp', 'R_Mos', '09234123451', '23451927', '2019-2-1', 'Shemiran, Shoush, Molavi, Narmak, Vanak'),
			('Nasiri', 'NotFound1234', 'Nasir1234', '09123452356', '23534612', '2018-3-12', 'Meydon Hor, Roudaki, Mosalla');
			
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

create table gallery(
	photo_url varchar(300) not null,
	photo_id int identity(10000, 1),
	username varchar(50) not null,
	primary key (photo_id, username),
	foreign key (username) references service_provider(username)
);

insert into gallery (photo_url, username)
	values ('https://cdn.bartarinha.ir/files/fa/news/1398/7/20/2180290_566.jpg', 'Mohsen_Hosseini'),
	('https://ipemdad.com/wp-content/uploads/2020/12/%D8%AA%D8%B9%D9%85%DB%8C%D8%B1-%D8%AA%D9%84%D9%88%DB%8C%D8%B2%DB%8C%D9%88%D9%86.webp', 'MahdiASh'),
	('https://repaire24.ir/media/k2/items/cache/2f2766fb7d5da7e6231d9ac592175eb3_XL.jpg', 'SamanMR'),
	('https://homeservize.com/blog1/wp-content/uploads/2020/10/installing-cabinets.jpg', 'MHashemi1379');

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

create table company(
	/*website varchar(100) this att will be added to company table once we use an alter command later*/
	username varchar(50) not null,
	primary key (username),
	foreign key (username) references service_provider(username)
);

insert into company (username)
	values ('Ayandeh_Ziba'), ('PorkaranePortalash'), ('NoandishaneSaee');

create table company_manager(
	first_name nvarchar(100),
	last_name nvarchar(100) not null,
	company_username varchar(50) not null,
	primary key (company_username),
	foreign key (company_username) references company(username)
);

insert into company_manager (first_name, last_name, company_username)
	values ('Hossein', 'Rahmani', 'Ayandeh_Ziba'), ('Sina', 'Ziaee', 'PorkaranePortalash');

insert into company_manager (last_name, company_username)
	values ('Shoeibi', 'NoandishaneSaee');

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
	values ('Motevaseli', '+989123123456', 234.23, 'mot1998_1234', 'AStrongPassword'),
		('Ramezani', '+9891249772309', 0, 'Sajj_R', 'Pass1234');

create table initial_order(
	description_of_requested_work nvarchar(2000) not null,
	estimation_price_request varchar(50) not null,
	id int identity(10000, 1) not null,
	primary key (id, estimation_price_request),
	foreign key (estimation_price_request) references client(username)
);

insert into initial_order (description_of_requested_work, estimation_price_request)
	values (N'لامپ تلویزیون شکسته و فقط نصفش روشن میشه بقیه ی صفحه کاملا تاریک و خاموشه، تلویزیون ۴۰ اینچ ال جی', 'Sajj_R'),
	(N'در کابینت خراب شده و لقی داره وقتی بازش می کنیم خیلی به سمت پایین کج می مونه', 'SMR'),
	(N'ماشینم استارت نمی خوره، بنزین داره و تسمه اش هم تازه عوض کردم نمی دونم چش شده', 'mot1998_1234'),
	(N'لوله ی آبگرمکن ترکیده و خیلی چکه می کنه حسابی آشپزخونه رو بو انداخته', 'MeliNo'),
	(N'روغن موتور ماشینم حسابی سیاه شده، لنت‌هاش هم فک کنم تموم شده باید عوض شه مدل ماشینم رنو مگانه', 'MeliNo'),
	(N'دیشب فوتبال بود اعصابم خورد شد زدم تلویزیونو شیکستم، وسطش سوراخ شده ولی بقیه اش سالمه!', 'mot1998_1234'),
	(N'آبگرمکن روشن نمیشه درجه‌ ی آب اش روی ۱ گیر کرده بالاتر نمیره نمی دونیم چیکار کنیم', 'SMR'),
	(N'چند سال ایران نبودم کابینت ها رو موریانه خورده از تو پوک شده اصن یه سرویس کامل نیاز داره...', 'Sajj_R');

create table estimate_price(
	initial_order_id int not null,
	initial_order_estimation_price_request varchar(50) not null,
	service_provider varchar(50) not null,
	estimated_price money not null,
	primary key (initial_order_id, initial_order_estimation_price_request, service_provider, estimated_price),
	foreign key (service_provider) references service_provider(username),
	foreign key (initial_order_id, initial_order_estimation_price_request) references initial_order(id, estimation_price_request)
);

insert into estimate_price (initial_order_id, initial_order_estimation_price_request, service_provider, estimated_price)
	values (10000, 'Sajj_R', 'MahdiASh', 2291.48), (10001, 'SMR', 'MHashemi1379', 412.32),
	(10002, 'mot1998_1234', 'Mohsen_Hosseini', 123.23), (10003, 'MeliNo', 'SamanMR', 1243.00),
	(10000, 'Sajj_R', 'Ayandeh_Ziba', 2312.12), (10001, 'SMR', 'Nasiri', 1241.32),
	(10002, 'mot1998_1234', 'NoandishaneSaee', 120.1), (10003, 'MeliNo', 'RezMosav', 1231.1),
	(10004, 'MeliNo', 'Mohsen_Hosseini', 134), (10004, 'MeliNo', 'NoandishaneSaee', 3465),
	(10005, 'mot1998_1234', 'MahdiASh', 9354), (10005, 'mot1998_1234', 'Ayandeh_Ziba', 623),
	(10006, 'SMR', 'SamanMR', 861), (10007, 'Sajj_R', 'MHashemi1379', 981);

create table finalized_order(
	client_comment nvarchar(2000),
	rating int not null,
	price money not null,
	initial_order_id int not null,
	initial_order_estimation_price_request varchar(50) not null,
	id int identity,
	primary key(initial_order_id, initial_order_estimation_price_request, id),
	foreign key (initial_order_id, initial_order_estimation_price_request) references initial_order(id, estimation_price_request),
	check (rating >= 0 and rating <= 5)
);

insert into finalized_order (client_comment, rating, price, initial_order_id, initial_order_estimation_price_request)
	values (N'کارشون رو سریع انجام دادن و الان تلویزیونم خیلی خوب شده مثل روز اولش دستشون درد نکنه', 5, 2789.67, 10000, 'Sajj_R'),
	(N'خیلی دیر اومد آخرش هم پونصد تومن اضافه تر گرفت', 1, 923.12, 10001, 'SMR'),
	(N'فعلا که ماشینم راه افتاده ولی خیلی بداخلاق بود می‌ترسیدم باهاش حرف بزنم!', 3, 123, 10002, 'mot1998_1234'),
	(N'خیلی خوبن واقعا دست و پنجه شون درد نکنه باادب و خوش اخلاق و کاربلد', 5, 2134, 10003, 'MeliNo'),
	(N'بد نبود اومد کارش رو انجام داد بی سر و صدا رفت انعام هم نخواست', 3, 124, 10004, 'MeliNo'),
	(N'راضی بودم فقط ای کاش ماسک می‌زد موقع کارش', 4, 124, 10005, 'mot1998_1234'),
	(N'وقتی رفت خونمون رو بوی سیگار برداشته بود هر چی هم بهش تذکر می‌دادیم که سیگار نکش اصن انگار نه انگار', 2, 345, 10006, 'SMR'),
	(N'پول کم گرفت خدا خیرش بده', 5, 165, 10007, 'Sajj_R');

/*insert into finalized_order (client_comment, rating, price, initial_order_id, initial_order_estimation_price_request)
	values(N'خیلی خیلی عالی', 100, 2000, 10003, 'MeliNo'); check constraint*/

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

insert into picks (client, initial_order_id, initial_order_estimation_price_request, service_provider)
	values ('MeliNo', 10003, 'MeliNo', 'SamanMR'), ('SMR', 10001, 'SMR', 'MHashemi1379'),
	('mot1998_1234', 10002, 'mot1998_1234', 'Mohsen_Hosseini'), ('Sajj_R', 10000, 'Sajj_R', 'MahdiASh'),
	('MeliNo', 10004, 'MeliNo', 'Mohsen_Hosseini'), ('mot1998_1234', 10005, 'mot1998_1234', 'MahdiASh'),
	('SMR', 10006, 'SMR', 'SamanMR'), ('Sajj_R', 10007, 'Sajj_R', 'MHashemi1379');

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
	foreign key(service_provider) references service_provider(username), /*used another table from another part------high possibility of error*/
	check (priod > 10000)
);

/*insert into long_term_contract(register_time, priod, client, service_provider)
	values ('2008-10-29', 1000, 'MeliNo', 'Mohsen_Hosseini'); not valid insert just to test check constraint*/

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
	vehicle_name nvarchar(100) not null,
	car_service nvarchar(100) not null,
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

create table device(
	device_name nvarchar(100) not null unique,
	electric_service nvarchar(100) not null,
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
values ('2008-10-29',12122121,'MeliNo','Mohsen_Hosseini'),
	('2009-10-29',12145121,'SMR','MahdiASh'),
	('2008-11-29',12567212,'mot1998_1234','SamanMR'),
	('2008-10-09',12898121,'Sajj_R','MHashemi1379');

--select * from long_term_contract;

/*services*/
insert into s_service(s_name)
values (N'تعمیر ماشین ایران خودرو'), (N'تعمیر ماشین رنو'), (N'تعمیر ماشین پراید'),
	(N'تعمیر ماشین پژو'), (N'تعمیر کابینت'), (N'تعمیر سینک'), (N'تعمیر لوله آشپزخونه'),
	(N'تعمیرات موبایل'), (N'تعمیرات کامپیوتر'), (N'تعمیرات کنسول بازی'), (N'تعمیر تلویزیون'),
	(N'شستن پنجره'), (N'تعمیرات لپتاپ'), (N'نظافت کف منزل'), (N'تعمیر  آب گرم کن');

/*provides*/
insert into provides(service_names,service_provider_username)
values (N'تعمیر ماشین ایران خودرو','Mohsen_Hosseini'), (N'تعمیر تلویزیون ','MahdiASh'),
	(N'تعمیر  آب گرم کن','SamanMR'), (N'تعمیر کابینت','MHashemi1379'), 
	(N'تعمیر ماشین رنو','Mohsen_Hosseini'), (N'تعمیر ماشین رنو','NoandishaneSaee'),
	(N'تعمیر ماشین ایران خودرو','NoandishaneSaee'), (N'تعمیر تلویزیون ','Ayandeh_Ziba'),
	(N'تعمیر کابینت','Nasiri'), (N'تعمیر کابینت','RezMosav');

--select * from provides;

/*car_service*/
insert into car_service(c_service_name)
values (N'تعمیر ماشین ایران خودرو'), (N'تعمیر ماشین رنو'), (N'تعمیر ماشین پراید'), (N'تعمیر ماشین پژو');

--select * from car_service;
/*vehicle*/
insert into vehicle(vehicle_name,car_service)
values (N'تندر',N'تعمیر ماشین ایران خودرو'), (N'سمند',N'تعمیر ماشین ایران خودرو'),
	(N'مگان',N'تعمیر ماشین رنو'), (N'تیبا',N'تعمیر ماشین پراید'), (N'206',N'تعمیر ماشین پژو'),
	(N'2008',N'تعمیر ماشین پژو'), (N'پرایدوانت',N'تعمیر ماشین پراید'),
	(N'فلوئنس',N'تعمیر ماشین رنو'), (N'دنا',N'تعمیر ماشین ایران خودرو'),
	(N'پراید141',N'تعمیر ماشین پراید'), (N'405',N'تعمیر ماشین پژو');

--select * from vehicle;
/*non_electric_kitchen_service*/
insert into non_electric_kitchen_service(k_service_name)
values(N'تعمیر کابینت'), (N'تعمیر سینک'), (N'تعمیر لوله آشپزخونه');

--select * from non_electric_kitchen_service;

insert into home_appliances(appliances_name,non_electric_kitchen_service)
values(N'کابینت',N'تعمیر کابینت'), (N'سینک ظرف شویی',N'تعمیر سینک'),
	(N'لوله های آب در آشپزخونه',N'تعمیر لوله آشپزخونه');

--select * from home_appliances;

insert into electric_service(e_service_name)
values(N'تعمیرات موبایل'), (N'تعمیرات کامپیوتر'), (N'تعمیرات لپتاپ'), (N'تعمیرات کنسول بازی'),
	(N'تعمیر تلویزیون ');

--select * from electric_service;

insert into device(device_name,electric_service)
values(N'S10',N'تعمیرات موبایل'), (N'S9',N'تعمیرات موبایل'), (N'S8',N'تعمیرات موبایل'),
	(N'ps4',N'تعمیرات کنسول بازی'), (N'LG7s',N'تعمیر تلویزیون '), (N'ideapad 330s',N'تعمیرات لپتاپ');

--select * from device;

insert into cleaning_service(clean_service_name,approximate_area_value)
values(N'شستن پنجره',N'ده تا دو در دو'), (N'نظافت کف منزل',N'60m^2');

--select * from cleaning_service;

insert into position(position_name,cleaning_service)
values(N'پنجره های اتاق خواب پذیرایی آشپزخونه',N'شستن پنجره'), (N'کف منزل',N'نظافت کف منزل');

--select * from position;


/*--------------------------simple select queries----------------------------------*/

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
/*---------------------------complicated select queries-----------------------------------------------*/

select * from service_provider inner join provides on service_provider.username=provides.service_provider_username;

select * from car_service inner join vehicle on car_service.c_service_name=vehicle.car_service;

select * from non_electric_kitchen_service inner join home_appliances
on non_electric_kitchen_service.k_service_name=home_appliances.non_electric_kitchen_service
where k_service_name<>N'تعمیر سینک';

select * from electric_service inner join device on device.electric_service=electric_service.e_service_name;

select * from cleaning_service inner join position on cleaning_service.clean_service_name=position.cleaning_service;

select * from client
where wallet_value>(select avg(wallet_value) from client);

select * from service_provider ,provides,car_service,s_service
where service_provider.username=provides.service_provider_username
and provides.service_names=s_service.s_name
and s_service.s_name=car_service.c_service_name;

/*---------------------------update queries--------------------------------*/

update client set wallet_value = wallet_value + 1000 where wallet_value < 1000;
select * from client;

delete from specialist where gender = 'female';
select * from specialist;

alter table company add website varchar(100);
update company set website = 'www.FardasazanAyandehZiba.ir' where username = 'Ayandeh_Ziba';
select * from company;

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
