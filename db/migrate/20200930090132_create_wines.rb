class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.string      :name,              null: false
      t.integer     :color_id,          null: false
      t.integer     :variety_id,        null: false
      t.integer     :country_id,        null: false
      t.string      :region
      t.date        :vintage,           null: false
      t.integer     :alcohol_volume_id, null: false
      t.string      :marriage_food
      t.string      :producer
      t.references  :user,              null:false, foreign_key: true
      t.timestamps
    end
  end
end
