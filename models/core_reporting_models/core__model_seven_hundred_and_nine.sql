with model_a as
  (select * exclude unqiue_key,
            unqiue_key as model_a_unqiue_key
   from {{ ref('int__revenue_model_one_thousand,_three_hundred_and_twenty_three') }}),
     model_b as
  (select * exclude unqiue_key,
            unqiue_key as model_b_unqiue_key
   from {{ ref('stg__sample_salesforce_data_leads') }}),
     model_c as
  (select * exclude unqiue_key,
            unqiue_key as model_c_unqiue_key
   from {{ ref('int__revenue_model_four_hundred_and_forty_two') }}),
     joined_models as
  (select a.*,
          b.*,
          c.*
   from model_a a
   inner join model_b b on a.model_a_unqiue_key = b.model_b_unqiue_key
   inner join model_c c on a.model_a_unqiue_key = b.model_c_unqiue_key)
select * exclude (model_a_unqiue_key, model_b_unqiue_key, model_c_unqiue_key),
         row_number() over (partition by 1
                            order by 1) as unqiue_key
from joined_models