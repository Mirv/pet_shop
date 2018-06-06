module Admin
  class PetsController < Admin::ApplicationController

### TODO remove if not needed - start!
    include Administrate::Punditize
    before_action :authenticate_admin

    def authenticate_admin
      # TODO Add authentication logic here.
      authenticate_user!
    end
    
    
### TODO remove if not needed - end!

    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      super
      @user_resources = current_user.user_detail.pets
      # @resources = @user_resources.published.
      @resources = @user_resources.page(params[:page]).per(10)
    end

    def new
      # @current_user will conflict if you set it here, don't use
      @current_owner = current_user.user_detail
      super
    end

    def create
      @user = current_user.user_detail # required for assoc relationship
      @pet = @user.pets.build
      super
    end
    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Pet.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
    # def pet_params
    #   params.require(:pet).permit(:name, :pet_status, :description, :pet_category_id, :location_id, :published, :visible, :available, :user_detail_id)
    # end
  end
end
