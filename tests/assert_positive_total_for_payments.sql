-- confirm that total amount is not negative
with 

payment as (
    select * from {{ ref('stg_payments') }}

)

Select
    order_id,
    sum(amount) as total_amount
from payment
group by order_id
having not(sum(amount) >= 0)