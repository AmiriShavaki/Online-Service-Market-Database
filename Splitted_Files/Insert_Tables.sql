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

insert into gallery (photo_url, username)
	values ('https://cdn.bartarinha.ir/files/fa/news/1398/7/20/2180290_566.jpg', 'Mohsen_Hosseini'),
	('https://ipemdad.com/wp-content/uploads/2020/12/%D8%AA%D8%B9%D9%85%DB%8C%D8%B1-%D8%AA%D9%84%D9%88%DB%8C%D8%B2%DB%8C%D9%88%D9%86.webp', 'MahdiASh'),
	('https://repaire24.ir/media/k2/items/cache/2f2766fb7d5da7e6231d9ac592175eb3_XL.jpg', 'SamanMR'),
	('https://homeservize.com/blog1/wp-content/uploads/2020/10/installing-cabinets.jpg', 'MHashemi1379');

insert into specialist (first_name, last_name, gender, age, degree_of_education, username)
	values ('Mohsen', 'Hosseini', 'male', 92, 'Master of Electronic Engineering from Iran University of Science and Technology',
			'Mohsen_Hosseini');

insert into specialist (last_name, gender, age, username)
	values ('Amiri Shavaki', 'male', 21, 'MahdiASh');

insert into specialist (first_name, last_name, gender, age, username)
	values ('Saman', 'Mohammadi Raouf', 'male', 21, 'SamanMR');

insert into specialist (first_name, last_name, gender, degree_of_education, username)
	values ('Maryam', 'Hashemi', 'female', 'Bachelors of Computer Engineering from Sharif University of Technology', 'MHashemi1379');

insert into company (username)
	values ('Ayandeh_Ziba'), ('PorkaranePortalash'), ('NoandishaneSaee');

insert into company_manager (first_name, last_name, company_username)
	values ('Hossein', 'Rahmani', 'Ayandeh_Ziba'), ('Sina', 'Ziaee', 'PorkaranePortalash');

insert into company_manager (last_name, company_username)
	values ('Shoeibi', 'NoandishaneSaee');

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

insert into initial_order (description_of_requested_work, estimation_price_request)
	values (N'لامپ تلویزیون شکسته و فقط نصفش روشن میشه بقیه ی صفحه کاملا تاریک و خاموشه، تلویزیون ۴۰ اینچ ال جی', 'Sajj_R'),
	(N'در کابینت خراب شده و لقی داره وقتی بازش می کنیم خیلی به سمت پایین کج می مونه', 'SMR'),
	(N'ماشینم استارت نمی خوره، بنزین داره و تسمه اش هم تازه عوض کردم نمی دونم چش شده', 'mot1998_1234'),
	(N'لوله ی آبگرمکن ترکیده و خیلی چکه می کنه حسابی آشپزخونه رو بو انداخته', 'MeliNo'),
	(N'روغن موتور ماشینم حسابی سیاه شده، لنت‌هاش هم فک کنم تموم شده باید عوض شه مدل ماشینم رنو مگانه', 'MeliNo'),
	(N'دیشب فوتبال بود اعصابم خورد شد زدم تلویزیونو شیکستم، وسطش سوراخ شده ولی بقیه اش سالمه!', 'mot1998_1234'),
	(N'آبگرمکن روشن نمیشه درجه‌ ی آب اش روی ۱ گیر کرده بالاتر نمیره نمی دونیم چیکار کنیم', 'SMR'),
	(N'چند سال ایران نبودم کابینت ها رو موریانه خورده از تو پوک شده اصن یه سرویس کامل نیاز داره...', 'Sajj_R');

insert into estimate_price (initial_order_id, initial_order_estimation_price_request, service_provider, estimated_price)
	values (10000, 'Sajj_R', 'MahdiASh', 2291.48), (10001, 'SMR', 'MHashemi1379', 412.32),
	(10002, 'mot1998_1234', 'Mohsen_Hosseini', 123.23), (10003, 'MeliNo', 'SamanMR', 1243.00),
	(10000, 'Sajj_R', 'Ayandeh_Ziba', 2312.12), (10001, 'SMR', 'Nasiri', 1241.32),
	(10002, 'mot1998_1234', 'NoandishaneSaee', 120.1), (10003, 'MeliNo', 'RezMosav', 1231.1),
	(10004, 'MeliNo', 'Mohsen_Hosseini', 134), (10004, 'MeliNo', 'NoandishaneSaee', 3465),
	(10005, 'mot1998_1234', 'MahdiASh', 9354), (10005, 'mot1998_1234', 'Ayandeh_Ziba', 623),
	(10006, 'SMR', 'SamanMR', 861), (10007, 'Sajj_R', 'MHashemi1379', 981);

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

insert into picks (client, initial_order_id, initial_order_estimation_price_request, service_provider)
	values ('MeliNo', 10003, 'MeliNo', 'SamanMR'), ('SMR', 10001, 'SMR', 'MHashemi1379'),
	('mot1998_1234', 10002, 'mot1998_1234', 'Mohsen_Hosseini'), ('Sajj_R', 10000, 'Sajj_R', 'MahdiASh'),
	('MeliNo', 10004, 'MeliNo', 'Mohsen_Hosseini'), ('mot1998_1234', 10005, 'mot1998_1234', 'MahdiASh'),
	('SMR', 10006, 'SMR', 'SamanMR'), ('Sajj_R', 10007, 'Sajj_R', 'MHashemi1379');

/*insert into long_term_contract(register_time, priod, client, service_provider)
	values ('2008-10-29', 1000, 'MeliNo', 'Mohsen_Hosseini'); not valid insert just to test check constraint*/

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