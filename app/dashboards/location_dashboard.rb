require "administrate/base_dashboard"

class LocationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    pets: Field::HasMany,
    user_detail: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    xcoordinate: Field::Number.with_options(decimals: 2),
    ycoordinate: Field::Number.with_options(decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    visible: Field::Boolean,
    active: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :pets,
    :user_detail,
    :id,
    :name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :pets,
    :user_detail,
    :id,
    :name,
    :xcoordinate,
    :ycoordinate,
    :created_at,
    :updated_at,
    :visible,
    :active,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :pets,
    # :user_detail,
    :name,
    :xcoordinate,
    :ycoordinate,
    :visible,
    :active,
  ].freeze

  # Overwrite this method to customize how locations are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(location)
    "Location ##{location.name}"
  end
  
  # since we hid user_detail_id from form, we permit it in strong_param here
  def permitted_attributes
    super + [:user_detail_id]
  end
end
