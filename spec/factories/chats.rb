FactoryGirl.define do
  factory :chat do
    message Faker::Pokemon.name
    image File.open(File.join(Rails.root, '/spec/fixture/photo.jpeg'))
    user
    group
  end
end
