FactoryBot.define do
  factory :teacher_room do
    name { Faker::Name.last_name }
    association :teacher
    association :student
  end
end
