class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :wine

  validates :user_id, uniqueness: { scope: :wine_id }
end