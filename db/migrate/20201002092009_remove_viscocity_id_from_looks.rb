class RemoveViscocityIdFromLooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :looks, :viscocity_id, :integer
  end
end
