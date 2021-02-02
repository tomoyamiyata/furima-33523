FactoryBot.define do
  factory :item do       
    name                       {"名前"}
    introduction               {"説明"}
    price                      {1000}
    estimated_shipping_dat_id  {2}
    delivery_area_id           {2}
    shipping_charge_id         {2}
    product_condition_id       {2}
    category_id                {2}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
