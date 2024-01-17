FactoryBot.define do
  factory :group do
    name { Faker::Lorem.sentence(word_count: 2) }
    icon { 'bill.png' }
  end
end
