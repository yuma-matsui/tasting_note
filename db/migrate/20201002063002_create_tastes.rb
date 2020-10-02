class CreateTastes < ActiveRecord::Migration[6.0]
  def change
    create_table :tastes do |t|
      t.integer     :attack_id,        null: false
      t.integer     :alcohol_level_id, null: false
      t.integer     :acidity_level_id, null: false
      t.integer     :tannic_level_id,  null: false
      t.integer     :after_flavor_id,  null: false
      t.integer     :description_id,   null: false
      t.text        :comment,          null: false
      t.references  :wine,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
