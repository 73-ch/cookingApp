class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_request_from
  before_action :configure_permitted_parameters, if: :devise_controller?

  def login_checker
    unless user_signed_in?
      redirect_to new_user_session_path, notice: "ログインしてください"
    end
  end

  private
  def set_request_from
    if session[:request_from]
      @request_from = session[:request_from]
    end
    # 現在のURLを保存しておく
    session[:request_from] = request.original_url
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
