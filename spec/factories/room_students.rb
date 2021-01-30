FactoryBot.define do
  factory :room_student do
    association :student
    association :room
  end
end