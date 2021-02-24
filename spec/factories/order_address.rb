FactoryBot.define do
  factory :order_address do
    city { '東京都' }
    address {'1-1'}
    postal_code {'123-4567'}
    phone_number {'00000000000'}
    delivery_source_id {2}
    token {"tok_abcdefghijk00000000000000000"}
    building{"東京ハイツ"}
    
  end
end