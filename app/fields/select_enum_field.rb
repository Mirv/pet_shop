require "administrate/field/base"

class SelectEnumField < Administrate::Field::Select
  def associated_resource_options
    Pet.pet_statuses.keys.to_a
  end
  
  def selected_option
    data
  end
  
  def to_s
    data
    # "string"
  end
end