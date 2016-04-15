class SurveysController < ApplicationController
  include Authentication
  before_action :set_survey, only: [:show, :update, :destroy]

  # GET /tours
  def index
    #@surveys = Survey.all.to_json(methods: :rating)
    @surveys = Survey.all

    render json: @surveys
  end

  # GET /tours/1
  def show
    render json: @survey
  end

  # POST /tours
  def create
    @survey = Survey.new(survey_params.merge(user: current_user))

    if @survey.save
      render json: @survey, status: :created, location: @survey
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tours/1
  def update
    if @survey.update(survey_params.merge(user: current_user))
      render json: @survey
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tours/1
  def destroy
    @survey.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(user: current_user)
    end

    # Only allow a trusted parameter "white list" through.
    def survey_params
      params.require(:survey).permit(
          :gender,
          :age,
          :how_many,
          :how_intentional,
          :player_type_killer,
          :player_type_achiever,
          :player_type_explorer,
          :player_type_socializer,
          :game_type_self_expression_1,
          :game_type_self_expression_2,
          :game_type_competition_1,
          :game_type_competition_2,
          :game_type_conflict_1,
          :game_type_conflict_2,
          :game_type_cooperation_1,
          :game_type_cooperation_2,
          :game_type_coordination_1,
          :game_type_coordination_2,
          :gamification_tutorial,
          :gamification_prefs,
          :gamification_fast_start,
          :gamification_challenges_like,
          :gamification_hints_like,
          :gamification_give_feedback_like,
          :gamification_given_feedback_like,
          :gamification_rewards_like,
          :gamification_progress_like,
          :using_app,
          :comment,
          :has_gamification,
          :has_gamification,
          :did_test_already,
          :tour_was_more_motivatable,
          :tour_was_more_motivatable_comment,
          :rating_about_gamification,
          :rating_about_gamification_comment
      )
    end
end
