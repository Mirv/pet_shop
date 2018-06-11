class ApplicationController < ActionController::Base
  include Pundit
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # important to note - this means either no user provided in addition to bad creditionals or permissions
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # rescue_from NoUserProvidedError, with: :no_user_provided
  
  # class NoUserProvidedError < Pundit::NotAuthorizedError 
  #   super
  # end
 
  private
 
    def user_not_authorized(exception)
      # TODO segment out the non not-authorized errors
      flash[:warning] = "Not authorized ... #{exception}."
      # redirect_to(request.referrer || root_path)
      # redirect_to(root_path)
      redirect_to '/landing_page/show'
      # render 'layouts/login' #  TODO set this to render login when failure
      # raise
    end
    
    def no_user_provided
      flash[:warning] = "No user provided to Pundit Gem to authorize against."
      redirect_to '/landing_page/show'
    end
  

  
end
