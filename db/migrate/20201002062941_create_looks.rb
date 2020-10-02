class CreateLooks < ActiveRecord::Migration[6.0]
  def change
    create_table :looks do |t|
      t.integer     :color_tone_id, null: false
      t.integer     :intensity_id,  null: false
      t.integer     :brightness_id, null: false
      t.integer     :viscosity_id,  null: false
      t.text        :comment,       null:false
      t.references  :wine,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
