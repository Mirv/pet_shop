class Pet < ApplicationRecord
  belongs_to :pet_category
  belongs_to :location
  
  scope :visible_pets, -> { where(visible: true) }
  scope :available_pets, -> { visible_pets.where(available: true) }
  
end
