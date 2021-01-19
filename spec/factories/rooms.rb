FactoryBot.define do
  factory :room do
    name {Faker::Name.last_name}
  end
end