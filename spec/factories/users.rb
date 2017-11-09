FactoryBot.define do

  factory :user do
    id    { Faker::Number.between(1, 2) }
    email { Faker::Internet.email}
    password { Faker::Internet.password }
    name { Faker::Name.name}
  end

end
