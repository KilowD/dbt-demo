select

  concat_ws(' ',customers.first_name,customers.last_name) as customer_fullname,
  orders.id,
  orders.order_date,
  orders.status as order_status,
  payment.paymentmethod,
  payment.amount,
  payment.status as payment_status

from
  {{ source('jaffle_shop', 'orders') }} as orders
left join 
  {{ source('jaffle_shop', 'customers') }} as customers
on
  orders.id=customers.id
inner join
  {{ source('stripe', 'payment') }}  as payment   


--