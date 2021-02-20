FactoryBot.define do
  factory :item do
   
   title              {'test'}
   description        {'test'}
   category_id           {2}
   status_id             {2}
   delivery_fee_id       {2}        
   delivery_source_id    {2}
   delivery_date_id      {2}
   product_price         {1000}

   association :user
   
   after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
   end
  end
end
