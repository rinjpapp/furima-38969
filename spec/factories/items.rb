FactoryBot.define do
  factory :item do
    transient do
      person { Gimei.name }
    end
    title { Faker::Commerce.product_name }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    content { Faker::Lorem.paragraphs }
    association :user
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    shipping_option_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    shipping_term_id { Faker::Number.between(from: 2, to: 4) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
