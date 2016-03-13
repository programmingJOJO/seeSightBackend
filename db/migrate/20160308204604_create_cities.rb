class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.integer :country_id, null: false
      t.float :lat
      t.float :lng
      t.string :zip_from
      t.string :zip_to

      t.timestamps
    end

    add_index :cities, :country_id
    add_index :cities, :name
    add_index :cities, :slug, unique: true
  end
end
