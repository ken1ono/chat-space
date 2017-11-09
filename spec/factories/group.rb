FactoryBot.define do

  factory :group do
    id   { Faker::Number.number(2) }
    name { Faker::Name.name }
  end
end
