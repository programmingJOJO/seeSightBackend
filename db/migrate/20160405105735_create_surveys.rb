class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.belongs_to :user
      t.string :gender
      t.integer :age
      t.integer :how_many
      t.integer :how_intentional
      t.boolean :player_type_killer
      t.boolean :player_type_achiever
      t.boolean :player_type_explorer
      t.boolean :player_type_socializer

      t.boolean :game_type_self_expression_1
      t.boolean :game_type_self_expression_2
      t.boolean :game_type_competition_1
      t.boolean :game_type_competition_2
      t.boolean :game_type_conflict_1
      t.boolean :game_type_conflict_2
      t.boolean :game_type_cooperation_1
      t.boolean :game_type_cooperation_2
      t.boolean :game_type_coordination_1
      t.boolean :game_type_coordination_2

      t.boolean :gamification_tutorial
      t.boolean :gamification_prefs

      t.string :gamification_fast_start
      t.integer :gamification_challenges_like
      t.integer :gamification_hints_like
      t.integer :gamification_give_feedback_like
      t.integer :gamification_given_feedback_like
      t.integer :gamification_rewards_like
      t.integer :gamification_progress_like

      t.integer :using_app
      t.text :comment

      t.timestamps
    end
  end
end
