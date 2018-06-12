module Admin
  class PetsController < Admin::ApplicationController
    before_action :authenticate_admin
### TODO remove if not needed - start!
    include Administrate::Punditize
    

    def authenticate_admin
      # TODO Add authentication logic here.
      authenticate_user!
    end

    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      # byebug
      @user_resources = current_user.user_detail.pets
      @resources = @user_resources.page(params[:page]).per(10)
      super
    end

    def create
      @current_owner = current_user.user_detail # required for assoc relationship
      params['pet']['user_detail_id'] = @current_owner.id
      super 
    end
    
    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Pet.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions

  end
end
