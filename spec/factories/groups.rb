FactoryBot.define do

  factory :group do
    id   { Faker::Number.between(1, 2) }
    name { Faker::Name.name }
  end

end
