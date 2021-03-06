FactoryBot.define do

  factory :message do
    id { Faker::Number.number(2) }
    body { Faker::Lorem.sentence}
    image  { fixture_file_upload("#{::Rails.root}/spec/fixtures/image.jpg", "image/jpg")}
    group
    user
  end
end
