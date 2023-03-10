FactoryBot.define do
  factory :order_address do
    post_code {'100-0052'}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city {Faker::Address.city}
    address {Faker::Address.street_address}
    building_name {Faker::Address.building_number}
    phone_number {Faker::Number.between(from: 1111111111, to: 99999999999)}
    token {"tok_abcdefghijk00000000000000000"}

  end
end
