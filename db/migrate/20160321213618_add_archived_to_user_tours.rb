class AddArchivedToUserTours < ActiveRecord::Migration[5.0]
  def change
    add_column :user_tours, :archived, :boolean, null: false, default: false
  end
end
