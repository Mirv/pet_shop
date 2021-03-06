require "administrate/base_dashboard"

class PetDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    pet_category: Field::BelongsTo,
    location: Field::BelongsTo,
    user_detail: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    published: Field::Boolean,
    visible: Field::Boolean,
    available: Field::Boolean,
    pet_status: Administrate::Field::SelectEnumField
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :pet_category,
    :name,
    :location,
    :user_detail,
    :pet_status,
    # :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :pet_category,
    :name,
    :location,
    :user_detail,
    :id,
    :description,
    :created_at,
    :updated_at,
    :published,
    :visible,
    :available,
    :pet_status,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :pet_category,
    :location,
    # :user_detail,  # we hide it from form & overwrite permitted_attributes below
    :name,
    :description,
    :published,
    :visible,
    :available,
    :pet_status,
  ].freeze

  # Overwrite this method to customize how pets are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(pet)
  #   "Pet ##{pet.id}"
  # end
  
  # since we hid user_detail_id from form, we permit it in strong_param here
  def permitted_attributes
    super + [:user_detail_id]
  end
end
