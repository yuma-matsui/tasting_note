FactoryBot.define do
  factory :taste do
    attack_id                 { 2 }
    alcohol_level_id          { 2 }
    acidity_level_id          { 2 }
    tannic_level_id           { 2 }
    after_flavor_id           { 2 }
    description_id            { 2 }
    comment                   { Faker::Lorem.sentences }
    association :wine
  end
end
