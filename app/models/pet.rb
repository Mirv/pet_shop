class Pet < ApplicationRecord
  # enum available: [:available, :unavailable]
  # enum visible: [:visible, :invisible]
  # enum published: [:published, :unpublished]
  
  belongs_to :pet_category
  belongs_to :location
  belongs_to :user_detail, inverse_of: :pets
  
  validates_presence_of :pet_category_id
  validates_presence_of :location_id

  # All pets not disabled by admin
  scope :visible_pets, -> { where(visible: true) }
  # All pets not disabled by admin + published
  scope :published, -> { visible_pets.where(published: true) }
  # All pets not disabled + published + not sold
  scope :available_pets, -> { published.where(available: true) }
end
