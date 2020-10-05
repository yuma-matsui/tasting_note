class Flavor < ApplicationRecord
  belongs_to :wine, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :impression
  belongs_to_active_hash :flavor_volume
  belongs_to_active_hash :first_flavor
  belongs_to_active_hash :second_flavor
  belongs_to_active_hash :third_flavor

  validates :impression, :flavor_volume, :first_flavor, :comment, presence: true
  validates :impression_id, :flavor_volume_id, :first_flavor_id, numericality: { other_than: 1 }

end
