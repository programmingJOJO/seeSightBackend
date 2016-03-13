class CreateHints < ActiveRecord::Migration[5.0]
  def change
    create_table :hints do |t|
      t.belongs_to :challenge, null: false, index: true
      t.text :description
      t.integer :position

      t.timestamps
    end
  end
end
