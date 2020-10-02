class CreateFlavors < ActiveRecord::Migration[6.0]
  def change
    create_table :flavors do |t|

      t.timestamps
    end
  end
end
