class Wine < ApplicationRecord
  belongs_to :user
  has_one :look
  has_one :flavor
  has_one :taste

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :color
  belongs_to_active_hash :variety
  belongs_to_active_hash :country
  belongs_to_active_hash :alcohol_volume

  validates :name, :color, :variety, :country, :vintage, :alcohol_volume, presence: true
  validates :color_id, :variety_id, :country_id, :alcohol_volume_id, numericality: { other_than: 1 }
  
end
