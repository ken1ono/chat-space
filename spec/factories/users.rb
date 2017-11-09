FactoryBot.define do
  pass = Faker::Internet.password(8)

  factory :user do
    id                     { Faker::Number.number(2) }
    email                 { Faker::Internet.email}
    password              pass
    password_confirmation pass
    name { Faker::Name.name}

    after(:create) do |user|
      create(:member, user: user, group: create(:group))
    end
  end
end
