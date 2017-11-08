FactoryBot.define do

  factory :message do
    id "1"
    body   "空です"
    image  { fixture_file_upload("#{::Rails.root}/spec/fixtures/image.jpg", "image/jpg")}
    group_id    "1"
    user_id     "1"
  end

end
