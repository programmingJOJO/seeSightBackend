class UserToursController < ApplicationController
  include Authentication
  before_action :set_user_tour, only: [:show, :update]

  # GET /tours
  def index
    @user_tours = UserTour.where(user: current_user).not_archived.to_json({ include: { :tour => { :include => :tags } } })

    render json: @user_tours
  end

  # GET /tours/1
  def show
    render json: @user_tour.to_json({include: [:user_tour_places, :user_tour_challenges, { :tour => { :include => :tags }}] })
  end

  # POST /tours
  def create
    UserTour.where(tour_id: params[:tour_id], user: current_user, archived: false).each{|ut| ut.archived = true; ut.save}
    @user_tour = UserTour.new(tour_id: params[:tour_id], user: current_user)
    if @user_tour.save
      render json: @user_tour.to_json({include: [:user_tour_places, :user_tour_challenges] })
    else
      render json: @user_tour.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tours/1
  def update
    if @user_tour.update_attributes(user_tour_params)
      render json: @user_tour
    else
      render json: @user_tour.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_tour
      @user_tour = UserTour.where(user: current_user, id: params[:id]).first
    end

    # Only allow a trusted parameter "white list" through.
    def user_tour_params
      params.require(:user_tour).permit(:completed, :rating, :archived, )
    end
end
