FactoryGirl.define do
  factory :product do
    name { Faker::Lorem.sentence }
    code { Faker::Commerce.product_name }
    association :supermarket
  end
end
