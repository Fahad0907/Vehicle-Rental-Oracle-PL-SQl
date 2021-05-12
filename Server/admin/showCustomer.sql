create or replace view Cusinfo(Customer_name, Customer_email,Customer_address, Customer_phone_number) as
select customerName, customerMail, customerAddress, customerPhone
from customer@site_link;


select * from Cusinfo;

commit;
