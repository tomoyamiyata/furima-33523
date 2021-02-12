FactoryBot.define do
  factory :order_address do
    postal_code                   {"111-1111"}
    delivery_area_id              {1}
    city                          {"神奈川"}
    address                       {"平塚"}
    building_name                 {"平塚2"}
    phone_number                  {"90999999900"}
    token                         {"tok_abcdefghijk00000000000000000"}
   
  end
end
