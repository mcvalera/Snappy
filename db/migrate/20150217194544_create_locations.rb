class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name

# precision is the total number of significant digits
# scale is the number of digits stored following the decimal point
      t.decimal :latitude, { precision: 10, scale: 6}
      t.decimal :longitude, { precision: 10, scale: 6}
      t.integer :user_id

      t.timestamps
    end
  end
end

