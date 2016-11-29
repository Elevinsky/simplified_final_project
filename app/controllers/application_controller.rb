class ApplicationController < ActionController::Base

  around_action :set_time_zone

  private

  def set_time_zone
    Time.use_zone('Central Time (US & Canada)') { yield }
  end

  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:role])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:role])
  end

end
