-- test for records with negative payment amount
with 

payment as (
    select * from {{ ref('stg_payments') }}
)

Select 
    order_id,
    sum(amount) as total_amount
from payment
group by order_id
having sum(amount) < 0