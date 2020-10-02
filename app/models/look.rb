class Look < ApplicationRecord
  belongs_to :wine

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :color_tone
  belongs_to_active_hash :intensity
  belongs_to_active_hash :brightness
  belongs_to_active_hash :viscosity

  validates :color_tone, :intensity, :brightness, :viscosity, :comment, presence: true
  validates :color_tone_id, :intensity_id, :brightness_id, :viscosity_id, numericality: { other_than: 1 }

end
