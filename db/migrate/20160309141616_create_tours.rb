class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.belongs_to :city, null: false, index: true
      t.string :slug
      t.integer :rating
      t.text :description

      t.timestamps
    end

    add_index :tours, :rating

    create_table :user_tours do |t|
      t.belongs_to :tour, null: false, index: true
      t.belongs_to :user, null: false, index: true
      t.boolean :completed, null: false, default: false
      t.integer :rating

      t.timestamps
    end

    add_index :user_tours, :completed

    create_table :tour_places do |t|
      t.belongs_to :place, null: false, index: true
      t.belongs_to :tour, null: false, index: true
      t.integer :default_position, null: false, default: 0

      t.timestamps
    end
  end
end
