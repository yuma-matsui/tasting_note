FactoryBot.define do
  factory :look do
    color_tone_id              { 2 }
    intensity_id               { 2 }
    brightness_id              { 2 }
    viscosity_id               { 2 }
    comment                    { Faker::Lorem.sentences }
    association :wine
  end
end
