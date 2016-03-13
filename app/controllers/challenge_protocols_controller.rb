class ChallengeProtocolsController < ApplicationController
  before_action :set_challenge_protocol, only: [:show, :update, :destroy]

  # GET /challenge_protocols
  def index
    @challenge_protocols = ChallengeProtocol.all

    render json: @challenge_protocols
  end

  # GET /challenge_protocols/1
  def show
    render json: @challenge_protocol
  end

  # POST /challenge_protocols
  def create
    @challenge_protocol = ChallengeProtocol.new(challenge_protocol_params)

    if @challenge_protocol.save
      render json: @challenge_protocol, status: :created, location: @challenge_protocol
    else
      render json: @challenge_protocol.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /challenge_protocols/1
  def update
    if @challenge_protocol.update(challenge_protocol_params)
      render json: @challenge_protocol
    else
      render json: @challenge_protocol.errors, status: :unprocessable_entity
    end
  end

  # DELETE /challenge_protocols/1
  def destroy
    @challenge_protocol.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge_protocol
      @challenge_protocol = ChallengeProtocol.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def challenge_protocol_params
      params.require(:challenge_protocol).permit(:challenge_id, :user_id, :state, :hint_id, :lat, :lng, :answer)
    end
end
