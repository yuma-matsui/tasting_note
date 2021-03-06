class Look < ApplicationRecord
  belongs_to :wine, optional: true
  has_one_attached :image, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :color_tone
  belongs_to_active_hash :intensity
  belongs_to_active_hash :brightness
  belongs_to_active_hash :viscosity

  validates :color_tone, :intensity, :brightness, :viscosity, :comment, :image, presence: true
  validates :color_tone_id, :intensity_id, :brightness_id, :viscosity_id, numericality: { other_than: 1, message: "を選択してください" }

end
