FactoryBot.define do
  factory :flavor do
    impression_id              { 2 }
    flavor_volume_id           { 2 }
    first_flavor_id            { 2 }
    second_flavor_id           { 2 }
    third_flavor_id            { 2 }
    comment                    { Faker::Lorem.sentences }
    association :wine
  end
end
