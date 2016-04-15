class AddHasChallengesToTour < ActiveRecord::Migration[5.0]
  def change
    add_column :tours, :has_challenges, :boolean, default: true, null: false
  end
end
