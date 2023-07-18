---testing source for payments
with payments_test
as
(
    select
        orderid,
        sum(amount) as total_amount
    From
         {{ source('stripe','payment')}}
    group by 1
    having not (total_amount >= 0)
)
select * from payments_test