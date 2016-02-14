class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.integer :city_id, null: false
      t.string :name, null: false
      t.text :description
      t.string :street
      t.string :street_number
      t.string :zip_code
      t.string :district
      t.float :lat
      t.float :lng
      t.string :homepage
      t.string :email
      t.integer :place_type, null: false, default: 0

      t.timestamps
    end
  end
end
