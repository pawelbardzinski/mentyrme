class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :set_skill_id

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :zip_code, :email, :password) }
  end

  def set_skill_id
  	if signed_in? && !current_user.profile.skills.empty?
  		@skill_id = current_user.profile.skills.first.id
  	end
  end

  private

  def user_not_authorized(exception)
    flash[:alert] = "You are not authorized to view the requested page"
    redirect_to(request.referrer || root_path)
  end
end
