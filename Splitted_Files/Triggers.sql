/*------------------------triggers-----------------------------*/

go
create trigger dbo.refuseManyInitOrders on dbo.initial_order after insert as if exists(select *
from dbo.initial_order initO, inserted, dbo.finalized_order 
where inserted.estimation_price_request = initO.estimation_price_request and inserted.id <> initO.id and
not exists(select * from dbo.finalized_order where dbo.finalized_order.initial_order_id = initO.id)) begin 
raiserror('This client has unfinished initial order from past', 16, 1); rollback transaction; return end;
go

select * from initial_order;
select * from finalized_order;
insert into initial_order(description_of_requested_work, estimation_price_request)
values (N'کابینتامون آهنیه درش زنگ زده نیاز به رنگ و سرویس مجدد داره', 'MeliNo');
select * from initial_order;
select * from finalized_order;
insert into initial_order(description_of_requested_work, estimation_price_request)
values (N'از ديشب پي اس فورمون روشن نميشه هركاري كرديم توروخدا كمك كنين تازه خريدمش', 'MeliNo');

/*agar satr jadidi dar jadval pick insert shavad --> haman sefaresh bayad dar finalized order niz dide shavad.*/
go
create or alter trigger InsertToFinalizedOrderWhenPicked
on picks
after insert 
as 
begin 

declare @FinalValue money;
set @FinalValue = (select distinct estimated_price as Final_price from estimate_price,initial_order,picks,inserted
where estimate_price.initial_order_id=initial_order.id
and inserted.service_provider=estimate_price.service_provider
and inserted.initial_order_id=initial_order.id)

declare @estimation_price_request varchar(50)
set @estimation_price_request = 
(select distinct estimate_price.initial_order_estimation_price_request
from estimate_price,inserted
where estimate_price.initial_order_id=inserted.initial_order_id
and estimate_price.service_provider = inserted.service_provider)

declare @initial_order_id INT;
set @initial_order_id =
(select inserted.initial_order_id
from inserted);

/*mikhahim be sorat default avg rate ra tagir nadahim pas bayad rate ra barabar ba avg rate begazarim*/
declare @avg_rate int;
set @avg_rate =
(select avg(finalized_order.rating)
from finalized_order)

insert into finalized_order(client_comment,rating,price,initial_order_estimation_price_request,initial_order_id)
values(
N'بدون نظر',@avg_rate,@FinalValue,@estimation_price_request,@initial_order_id
)
end
go

--example for this trigger:
select * from picks;
select * from finalized_order;
insert into picks
values('MeliNo',10003,'MeliNo','RezMosav');
select * from picks;
select * from finalized_order;

delete from finalized_order where id=9;
delete from picks where initial_order_id=10003 and service_provider='RezMosav';

/*--------------------------------------------------*/
/*zamani ke final order dorost shod az wallet client on megdar pol ro bardare*/
go 
create trigger bardashtAzWallet
on finalized_order
after insert 
as
begin
declare @Price money;
set @Price = 
(select inserted.price
from inserted)
update cl1
set wallet_value = wallet_value-@Price;
end
go

--example for trigger:
select * from cl1;
select * from finalized_order;
insert into finalized_order(client_comment,rating,price,initial_order_estimation_price_request,initial_order_id)
values(
N'بدون نظر',5,50,'MeliNo',10003
)
select * from cl1;
select * from finalized_order;

delete from finalized_order
where price=50 and initial_order_estimation_price_request='MeliNo' and initial_order_id=10003;
