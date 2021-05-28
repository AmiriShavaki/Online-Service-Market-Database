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
		values ('NoandishaneSaee', '14253462', '+989123123132')

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
