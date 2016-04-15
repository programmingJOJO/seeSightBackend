class AddAdditionalFieldsToSurvey < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :has_gamification, :boolean, default: true, null: false
    add_column :surveys, :did_test_already, :boolean, default: false, null: false
    add_column :surveys, :tour_was_more_motivatable, :integer
    add_column :surveys, :tour_was_more_motivatable_comment, :text
    add_column :surveys, :rating_about_gamification, :integer
    add_column :surveys, :rating_about_gamification_comment, :text
  end
end
