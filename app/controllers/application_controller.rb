class ApplicationController < ActionController::Base
  include Pundit
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 
  private
 
    def user_not_authorized
      # TODO segment out the non not-authorized errors
      flash[:warning] = "You are not authorized to perform this action."
      # redirect_to(request.referrer || root_path)
      # redirect_to(root_path)
      redirect_to '/landing_page/show'
      # raise
    end
  
end
