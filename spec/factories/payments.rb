FactoryBot.define do
  factory :payment do
    name { Faker::Name.name }
    amount { Faker::Number.decimal(l_digits: 2) }
    author_id { nil }
  end
end
