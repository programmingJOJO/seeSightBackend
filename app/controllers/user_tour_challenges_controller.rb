class UserTourChallengeController < ApplicationController
  include Authentication
  before_action :set_tour_challenge, only: [:show, :update]

  # GET /tours
  def index
    @user_tour_challenges = UserTourChallenge.all

    render json: @user_tour_challenges
  end

  # GET /tours/1
  def show
    render json: @user_tour_challenge
  end

  # POST /tours
  def create
    if @user_tour_challenge.save
      render json: @user_tour_challenge, status: :created, location: @user_tour_challenge
    else
      render json: @user_tour_challenge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tours/1
  def update
    if @user_tour_challenge.update(user_tour_challenge_params)
      render json: @user_tour_challenge
    else
      render json: @user_tour_challenge.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_tour_challenge
      @user_tour_challenge = UserTourChallenge.where(user_tour_id: params[:user_tour_id], challenge_id: params[:challenge_id]).first
    end

    # Only allow a trusted parameter "white list" through.
    def user_tour_challenge_params
      params.require(:user_tour_challenge).permit(:state)
    end
end
