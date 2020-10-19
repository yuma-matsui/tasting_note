class Wine < ApplicationRecord
  belongs_to :user
  has_one :look, dependent: :destroy
  has_one :flavor, dependent: :destroy
  has_one :taste, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_many :favorites, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :color
  belongs_to_active_hash :variety
  belongs_to_active_hash :country
  belongs_to_active_hash :alcohol_volume

  validates :name, :color, :variety, :country, :vintage, :alcohol_volume, :image, presence: true
  validates :color_id, :variety_id, :country_id, :alcohol_volume_id, numericality: { other_than: 1, message: "を選択してください" }

  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
