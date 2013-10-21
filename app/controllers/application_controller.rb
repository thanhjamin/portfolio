class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:error] = "You do not have the proper permission to do this action"
    redirect_to request.headers["Referer"] || root_path
  end
end
