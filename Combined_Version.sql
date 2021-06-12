/*create table service_provider(
	username varchar(50) not null,
	passwrd varchar(50) not null,
	address_on_social_networks varchar(50),
	phone_number varchar(15),
	licence_number varchar(15),
	start_year date,
	location_range_of_service nvarchar(100),
	primary key (username)
);*/

create table sp1(
	username varchar(50) not null,
	passwrd varchar(50) not null,
	start_year date,
	location_range_of_service nvarchar(100),
	primary key (username)
);

create table sp2(
	username varchar(50) not null,
	address_on_social_networks varchar(50),
	primary key (username),
	foreign key (username) references sp1(username)
);

create table sp3(
	username varchar(50) not null,
	phone_number varchar(15),
	primary key (username),
	foreign key (username) references sp1(username)
);

create table sp4(
	username varchar(50) not null,
	licence_number varchar(15),
	primary key (username),
	foreign key (username) references sp1(username)
);

insert into sp1(username, passwrd, start_year, location_range_of_service)
	values ('Mohsen_Hosseini', 'pAssword4', '2015-12-17', 'Pasdaran, Azadi, Navvab'),
		('RezMosav', 'IndComp', '2019-2-1', 'Shemiran, Shoush, Molavi, Narmak, Vanak'),
		('Nasiri', 'NotFound1234', '2018-3-12', 'Meydon Hor, Roudaki, Mosalla')

insert into sp1(username, passwrd, location_range_of_service)
	values ('MahdiASh', '12344321', 'Jamalzadeh, Shahr e Rey, Tajrish, Azadegan, Mehrabad'),
	('SamanMR', '87654321', 'Lalehzar, Naziabad, Yaftabad, Meydan Resalat, Piroozi'),
	('PorkaranePortalash', '12345678', 'Pasdaran, Monirye, Tajrish, Darvazeh ghaar');

insert into sp1(username, passwrd, start_year)
	values ('MHashemi1379', '13792000', '2013-5-4');

insert into sp1(username, passwrd)
	values ('Ayandeh_Ziba', 'DontHackMePls'),
		('NoandishaneSaee', '14253462');

insert into sp2(username, address_on_social_networks)
	values ('Mohsen_Hosseini', 'MohHoss'),
		('RezMosav', 'R_Mos'),
		('Nasiri', 'Nasir1234'),
		('MahdiASh', 'MA1379'),
		('Ayandeh_Ziba','AyandeRoshanAstDDD')

insert into sp3(username, phone_number)
	values ('Mohsen_Hosseini', '09141468677'),
		('RezMosav', '09234123451'),
		('Nasiri', '09123452356'),
		('MahdiASh', '09222702476'),
		('SamanMR', '09105983290'),
		('Ayandeh_Ziba','02144124124'),
		('PorkaranePortalash', '0212323233'),
		('NoandishaneSaee', '+989123123132');

insert into sp4(username, licence_number)
	values ('Mohsen_Hosseini', '723986459'),
		('RezMosav', '23451927'),
		('Nasiri', '23534612'),
		('MHashemi1379', '3452134')

create table gallery(
	photo_url varchar(300) not null,
	photo_id int identity(10000, 1),
	username varchar(50) not null,
	primary key (photo_id, username),
	foreign key (username) references sp1(username)
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
	foreign key (username) references sp1(username)
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
	foreign key (username) references sp1(username)
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

/*create table client(
	first_name nvarchar(100),
	last_name nvarchar(100) not null,
	phone_number varchar(15),
	wallet_value money not null,
	username varchar(50) not null,
	passwrd varchar(50) not null,
	primary key(username)
);*/

create table cl1(
	first_name nvarchar(100),
	last_name nvarchar(100) not null,
	wallet_value money not null,
	username varchar(50) not null,
	passwrd varchar(50) not null,
	primary key(username)
);

create table cl2(
	phone_number varchar(15),
	username varchar(50),
	primary key(username),
	foreign key (username) references cl1(username)
);

insert into cl1 (first_name, last_name, wallet_value, username, passwrd)
	values ('Melika', 'Nobakhtian', 100.2, 'MeliNo', 'perspolis');

insert into cl1 (first_name, last_name, wallet_value, username, passwrd)
	values ('Seyed Mahdi', 'Razavi', 3124.123, 'SMR', 'AlAla1234');

insert into cl1 (last_name, wallet_value, username, passwrd)
	values ('Motevaseli', 234.23, 'mot1998_1234', 'AStrongPassword'),
		('Ramezani', 0, 'Sajj_R', 'Pass1234');

insert into cl2 (username, phone_number)
	values ('mot1998_1234', '+989123123456'),
		('Sajj_R', '+9891249772309'),
		('MeliNo', '+989131231231');

create table initial_order(
	description_of_requested_work nvarchar(2000) not null,
	estimation_price_request varchar(50) not null,
	id int identity(10000, 1) not null,
	primary key (id, estimation_price_request),
	foreign key (estimation_price_request) references cl1(username)
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
	primary key (initial_order_id, initial_order_estimation_price_request, service_provider),
	foreign key (service_provider) references sp1(username),
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
	foreign key (client) references cl1(username),
	foreign key (initial_order_id, initial_order_estimation_price_request) references initial_order(id, estimation_price_request),
	foreign key (service_provider) references sp1(username)
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
	foreign key(client) references cl1(username),/*used another table from another part------high possibility of error*/
	foreign key(service_provider) references sp1(username), /*used another table from another part------high possibility of error*/
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
	foreign key(service_provider_username) references sp1(username)/*used another table from another part------high possibility of error*/
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
	(N'شستن پنجره'), (N'تعمیرات لپتاپ'), (N'نظافت کف منزل'), (N'تعمیر  آب گرم کن'), 
	(N'آبیاری گیاهان دریایی');

/*provides*/
insert into provides(service_names,service_provider_username)
values (N'تعمیر ماشین ایران خودرو','Mohsen_Hosseini'), (N'تعمیر تلویزیون ','MahdiASh'),
	(N'تعمیر  آب گرم کن','SamanMR'), (N'تعمیر کابینت','MHashemi1379'), 
	(N'تعمیر ماشین رنو','Mohsen_Hosseini'), (N'تعمیر ماشین رنو','NoandishaneSaee'),
	(N'تعمیر ماشین ایران خودرو','NoandishaneSaee'), (N'تعمیر تلویزیون ','Ayandeh_Ziba'),
	(N'تعمیر کابینت','Nasiri'), (N'تعمیر کابینت','RezMosav'), 
	(N'شستن پنجره','NoandishaneSaee'), (N'آبیاری گیاهان دریایی','NoandishaneSaee'),
	(N'تعمیر سینک', 'Ayandeh_Ziba'), (N'نظافت کف منزل', 'Ayandeh_Ziba'),
	(N'تعمیرات لپتاپ', 'PorkaranePortalash'), (N'تعمیرات کامپیوتر', 'PorkaranePortalash'),
	(N'تعمیرات کنسول بازی', 'PorkaranePortalash');

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

/*---------------------------update queries--------------------------------*/

update cl1 set wallet_value = wallet_value + 1000 where wallet_value < 1000;
select * from cl1;

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
select * from sp1;
select * from sp2;
select * from sp3;
select * from sp4;
select * from gallery; 
select * from specialist;
select * from company;
select * from company_manager;
select * from finalized_order;
select * from initial_order;
select * from estimate_price;
select * from cl1;
select * from cl2;
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

/*------------------------Views--------------------------- */
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
/*------------------------drop table--------------------------- */


drop table long_term_contract;
drop table provides;
drop table picks;
drop table estimate_price;
drop table finalized_order;
drop table initial_order;
drop table cl2;
drop table cl1;
drop table gallery;
drop table specialist;
drop table company_manager;
drop table company;
drop table sp4;
drop table sp3;
drop table sp2;
drop table sp1;
drop table vehicle;
drop table car_service;
drop table home_appliances;
drop table non_electric_kitchen_service;
drop table device;
drop table electric_service;
drop table position;
drop table cleaning_service;
drop table s_service;
