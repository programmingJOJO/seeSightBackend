class HintsController < ApplicationController
  before_action :set_hint, only: [:show, :update, :destroy]

  # GET /hints
  def index
    @hints = Hint.all

    render json: @hints
  end

  # GET /hints/1
  def show
    render json: @hint
  end

  # POST /hints
  def create
    @hint = Hint.new(hint_params)

    if @hint.save
      render json: @hint, status: :created, location: @hint
    else
      render json: @hint.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hints/1
  def update
    if @hint.update(hint_params)
      render json: @hint
    else
      render json: @hint.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hints/1
  def destroy
    @hint.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hint
      @hint = Hint.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hint_params
      params.require(:hint).permit(:challenge_id, :description, :order)
    end
end
