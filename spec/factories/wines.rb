FactoryBot.define do
  factory :wine do
    name                  { Faker::Name.name }
    color_id              { 2 }
    variety_id            { 2 }
    country_id            { 2 }
    region                { Faker::Name.name }
    vintage               { "2018-01-01"}
    alcohol_volume_id     { 2 }
    marriage_food         { Faker::Name.name }
    producer              { Faker::Name.name }
    association :user
  end
end
