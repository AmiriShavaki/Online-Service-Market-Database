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

create table gallery(
	photo_url varchar(300) not null,
	photo_id int identity(10000, 1),
	username varchar(50) not null,
	primary key (photo_id, username),
	foreign key (username) references sp1(username)
);

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

create table company(
	/*website varchar(100) this att will be added to company table once we use an alter command later*/
	username varchar(50) not null,
	primary key (username),
	foreign key (username) references sp1(username)
);

create table company_manager(
	first_name nvarchar(100),
	last_name nvarchar(100) not null,
	company_username varchar(50) not null,
	primary key (company_username),
	foreign key (company_username) references company(username)
);

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

create table initial_order(
	description_of_requested_work nvarchar(2000) not null,
	estimation_price_request varchar(50) not null,
	id int identity(10000, 1) not null,
	primary key (id, estimation_price_request),
	foreign key (estimation_price_request) references cl1(username)
);

create table estimate_price(
	initial_order_id int not null,
	initial_order_estimation_price_request varchar(50) not null,
	service_provider varchar(50) not null,
	estimated_price money not null,
	primary key (initial_order_id, initial_order_estimation_price_request, service_provider),
	foreign key (service_provider) references sp1(username),
	foreign key (initial_order_id, initial_order_estimation_price_request) references initial_order(id, estimation_price_request)
);

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