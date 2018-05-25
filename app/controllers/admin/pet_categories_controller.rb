module Admin
  class PetCategoriesController < Admin::ApplicationController

    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      super
      @resources = PetCategory.
        page(params[:page]).
        per(10)
        @user = current_user
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   PetCategory.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
