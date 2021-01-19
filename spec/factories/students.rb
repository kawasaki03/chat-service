FactoryBot.define do
  factory :student do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
    association :teacher
    status_message {Faker::Lorem.sentence}
  

  after(:build) do |message|
    message.image.attach(io: File.open('public/images/piano.png'), filename: 'piano.png')
  end
end
end