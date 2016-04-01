class UsersController < ApplicationController
  include Authentication

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: current_user.to_json({include: :tags})
  end

  # POST /users
  def create
    @user = params[:user] ? User.new(params[:user]) : User.new_guest

    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    @user = current_user
    if @user.update(user_params)
      @user.tag_ids=(params[:tag_ids]) if params[:tag_ids].present?
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :token, :role, tag_ids: [])
    end
end
