class UserToursController < ApplicationController
  include Authentication
  before_action :set_tour, only: [:show, :update]

  # GET /tours
  def index
    @user_tours = UserTour.where(user: current_user).not_archived.to_json({ include: :tour })

    render json: @user_tours
  end

  # GET /tours/1
  def show
    render json: @user_tour.to_json({include: :user_tour_places })
  end

  # POST /tours
  def create
    UserTour.where(tour_id: params[:tour_id], user: current_user, archived: false).each{|ut| ut.archived = true; ut.save}
    @user_tour = UserTour.new(tour_id: params[:tour_id], user: current_user)
    @user_tour.places=(Tour.find(params[:tour_id]).places)
    if @user_tour.save
      render json: @user_tour.to_json({include: :user_tour_places }), status: :created, location: @user_tour
    else
      render json: @user_tour.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tours/1
  def update
    if @user_tour.update(tour_params.merge(user: current_user))
      render json: @user_tour
    else
      render json: @user_tour.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @user_tour = UserTour.where(user: current_user, id: params[:id]).first
    end

    # Only allow a trusted parameter "white list" through.
    def tour_params
      params.require(:user_tour).permit(:tour_id, :completed)
    end
end
