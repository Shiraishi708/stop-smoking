class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
     redirect_to login_url
    end 
  end
  def counts(user)
    @count_stop_smoking_info = use.stop_smoking_info.count
  end
end
