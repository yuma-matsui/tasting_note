class CreateFlavors < ActiveRecord::Migration[6.0]
  def change
    create_table :flavors do |t|
      t.integer      :impression_id,    null: false
      t.integer      :flavor_volume_id, null: false
      t.integer      :first_flavor_id,  null: false
      t.integer      :second_flavor_id
      t.integer      :third_flavor_id
      t.text         :comment,          null: false
      t.references   :wine,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
