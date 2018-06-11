module Admin
  class LocationsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    include Administrate::Punditize
    before_action :authenticate_admin
    
    def index
      super
      
      # only changes to the user's own location
      @resources = policy_scope(Location)
    end

    def new
      @resources = policy_scope(Location)
      @current_owner = current_user.build_user_detail
      super
    end
    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Location.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
