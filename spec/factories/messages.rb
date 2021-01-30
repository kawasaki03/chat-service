FactoryBot.define do
  factory :message do
    content { Faker::Lorem.sentence }
    association :student
    association :room

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/piano.png'), filename: 'piano.png')
    end
  end
end
