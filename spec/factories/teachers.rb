FactoryBot.define do
  factory :teacher do
    id = 'a' + '1' + Faker::Internet.password(min_length: 8)
    id {id}
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = 'a' + '1' + Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
    status_message {Faker::Lorem.sentence}
  
  after(:build) do |teacher|
    teacher.image.attach(io: File.open('public/images/piano.png'), filename: 'piano.png')
  end
end
end