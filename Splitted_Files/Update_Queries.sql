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