class UserTourPlacesController < ApplicationController
  include Authentication
  before_action :set_tour_place, only: [:show, :update]

  # GET /tours
  def index
    @user_tour_places = UserTour.where(id: params[:user_tour_id], user: current_user).any? ? UserTourPlace.where(user_tour_id: params[:user_tour_id]) : UserTourPlace.none

    render json: @user_tour_places
  end

  # GET /tours/1
  def show
    render json: @user_tour_place
  end

  # POST /tours
  def create
    @user_tour_place = UserTourPlace.new(user_tour_id: params[:tour_id], user: current_user)

    if @user_tour_place.save
      render json: @user_tour_place, status: :created, location: @user_tour_place
    else
      render json: @user_tour_place.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tours/1
  def update
    if @user_tour_place.update(tour_params)
      render json: @user_tour_place
    else
      render json: @user_tour_place.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour_place
      @user_tour_place = UserTourPlace.find_by(user_tour_id: params[:user_tour_id], place_id: params[:place_id])
     # @user_tour_place = UserTour.where(id: params[:user_tour_id], user: current_user).any? ? UserTourPlace.find_by(user_tour_id: params[:user_tour_id], place_id: params[:place_id]) : nil
    end

    # Only allow a trusted parameter "white list" through.
    def tour_params
      params.require(:user_tour_place).permit(:user_tour_id, :place_id, :visited, :position)
    end
end
