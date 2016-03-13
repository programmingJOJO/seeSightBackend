class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :token
      t.integer :role, null: false, default: 0

      t.timestamps
    end

    add_index :users, :role

    create_table :user_tour_places do |t|
      t.belongs_to :place, null: false, index: true
      t.belongs_to :user_tour, null: false, index: true
      t.integer :position, null: false, default: 0
      t.boolean :visited, null: false, default: false

      t.timestamps
    end

    add_index :user_tour_places, :visited
  end
end
