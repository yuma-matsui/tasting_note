class CreateLooks < ActiveRecord::Migration[6.0]
  def change
    create_table :looks do |t|

      t.timestamps
    end
  end
end
