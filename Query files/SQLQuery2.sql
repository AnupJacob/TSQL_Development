select * from T_WACUSTOMERDETAILS;

select * from T_WAPAYMENTDETAILS;
select * from T_WARIDEDETAILS;


select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='T_WAPAYMENTDETAILS';


alter procedure P_customerdetails 
	@firstname varchar(100)
as
begin
select
	cd.CUSTOMER_ID,
	cd.CUSTOMER_NAME,
	cd.CUSTOMER_ADDRESS,
	cd.CONTACT,
	cd.EMAIL_ID,
	cd.CHANGED_DATE,
	pd.PAYMENT_ID,
	pd.RIDE_NUMBER,
	pd.BOOKING_DATE,
	pd.PAYMENT_STATUS,
	pd.PAYMENT_METHOD,
	pd.CHANGED_DATE
from
	T_WACUSTOMERDETAILS CD join
	T_WAPAYMENTDETAILS PD
on 
	cd.CUSTOMER_ID = pd.CUSTOMER_ID and
	cd.CUSTOMER_NAME like ''+@firstname+'%';

end


exec P_customerdetails @firstname = 'Va'

create trigger tg_delete
on T_WAPAYMENTDETAILS
after delete
as
begin

	print('Delete operation is forbidden operation. Rollback initiated')

	rollback;
	return;
end

drop trigger tg_delete;


delete from T_WAPAYMENTDETAILS where CUSTOMER_ID=20004;


30006	20004	10002	2022-01-19	1	CASH	2022-01-19


create clustered index id_payment on T_WAPAYMENTDETAILS(customer_id);


drop index id_payment on T_WAPAYMENTDETAILS
