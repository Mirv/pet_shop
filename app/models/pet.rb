class Pet < ApplicationRecord
  belongs_to :pet_category
  belongs_to :location
  
end
