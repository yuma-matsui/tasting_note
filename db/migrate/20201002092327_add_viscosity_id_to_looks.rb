class AddViscosityIdToLooks < ActiveRecord::Migration[6.0]
  def change
    add_column :looks, :viscosity_id, :integer, null: false
  end
end
