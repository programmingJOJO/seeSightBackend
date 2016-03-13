class CreateChallengeSolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :challenge_solutions do |t|
      t.belongs_to :challenge, null: false, index: true
      t.string :answer, null: false
      t.boolean :truth, null: false, default: true

      t.timestamps
    end

    add_index :challenge_solutions, :truth
  end
end
