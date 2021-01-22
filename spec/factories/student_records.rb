FactoryBot.define do
  factory :student_record do
    title {Faker::Lorem.sentence}
    note {Faker::Lorem.sentence}
    association :student
    association :teacher
end
end