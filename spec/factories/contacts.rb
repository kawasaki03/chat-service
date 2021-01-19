FactoryBot.define do
  factory :contact do
    content {Faker::Lorem.sentence}
    is_student {0}
    association :teacher_room

  after(:build) do |contact|
    contact.image.attach(io: File.open('public/images/piano.png'), filename: 'piano.png')
  end
end
end