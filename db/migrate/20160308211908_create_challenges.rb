class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.belongs_to :place, null: false, index: true
      t.integer :difficulty, null: false, default: 1
      t.text :question, null: false
      t.float :lat
      t.float :lng
      t.text :additional_content

      t.timestamps
    end

    add_index :challenges, [:lat, :lng]
    add_index :challenges, :difficulty

    create_table :user_tour_challenges do |t|
      t.belongs_to :challenge, null: false, index: true
      t.belongs_to :user_tour, null: false, index: true
      t.integer :state, null: false, default: 0
      t.float :lat
      t.float :lng
      t.integer :hint_id
      t.string :answer

      t.timestamps
    end

    add_index :user_tour_challenges, :state

    create_table :challenge_protocols do |t|
      t.belongs_to :user_tour_challenge, null: false, index: true
      t.integer :state
      t.integer :hint_id
      t.float :lat
      t.float :lng
      t.string :answer

      t.timestamps
    end

    add_index :challenge_protocols, :state
  end
end
