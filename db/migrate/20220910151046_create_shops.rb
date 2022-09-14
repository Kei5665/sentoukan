class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.string :opening_hours
      t.string :closing_time
      t.string :address, null: false
      t.string :place_id

      t.timestamps
    end
  end
end
