class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name, uniqueness: true

      t.timestamps
    end

    create_table :tags_users, id: false do |t|
      t.belongs_to :tag, null: false, index: true
      t.belongs_to :user, null: false, index: true

      t.timestamps
    end

    create_table :tags_tours, id: false do |t|
      t.belongs_to :tag, null: false, index: true
      t.belongs_to :tour, null: false, index: true

      t.timestamps
    end
  end
end
