class Taste < ApplicationRecord
  belongs_to :wine, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :attack
  belongs_to_active_hash :alcohol_level
  belongs_to_active_hash :acidity_level
  belongs_to_active_hash :tannic_level
  belongs_to_active_hash :after_flavor
  belongs_to_active_hash :description

  validates :attack, :alcohol_level, :acidity_level, :tannic_level, :after_flavor, :description, :comment, presence: true
  validates :attack_id, :alcohol_level_id, :acidity_level_id, :tannic_level_id, :after_flavor_id, :description_id, numericality: { other_than: 1 }

end
