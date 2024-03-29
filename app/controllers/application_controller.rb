class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    @current_user = User.where(:id=>session[:current_user_id]).first
  end
  def authenticate
    unless(current_user)
      redirect_to '/auth/facebook'
    end
  end
end
