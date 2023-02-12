with model_a as
  (select *
   from {{ ref('int__finance_model_five_hundred_and_twenty') }})
select * exclude unqiue_key,
         row_number() over (partition by 1
                            order by 1) as unqiue_key
from model_a