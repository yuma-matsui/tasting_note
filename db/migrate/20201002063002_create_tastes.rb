class CreateTastes < ActiveRecord::Migration[6.0]
  def change
    create_table :tastes do |t|

      t.timestamps
    end
  end
end
