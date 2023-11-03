FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea.type }
    temperature { Faker::Number.between(from: 170, to: 220) }
    brew_time { Faker::Number.between(from: 2, to: 6) }
  end
end