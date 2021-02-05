FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
      after(:build) do |message|
        message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
  end
end