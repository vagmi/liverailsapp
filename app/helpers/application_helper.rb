module ApplicationHelper
  def current_user
    @current_user = User.where(:id=>session[:current_user_id]).first
  end
end
