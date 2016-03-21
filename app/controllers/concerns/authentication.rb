module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user

    def current_user
      @current_user ||= begin
        User.find_by_token(params[:token])
      end
    end
  end

  def authenticate_user
    unless current_user
      if params[:token]
        @current_user = User.find_or_create_by!(token: params[:token])
      end
    end
  end
end
