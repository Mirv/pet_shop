class Pet < ApplicationRecord
  belongs_to :pet_category
  belongs_to :location
  belongs_to :user_detail, inverse_of: :pets
  
  validates_presence_of :pet_category_id
  validates_presence_of :location_id
  validates_presence_of :user_detail_id
  
  scope :visible_pets, -> { where(visible: true) }
  scope :available_pets, -> { visible_pets.where(available: true) }
end
