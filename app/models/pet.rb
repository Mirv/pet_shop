class Pet < ApplicationRecord
  # first 10,000 are user status, 20k's are business status, 30k's are anti-troll
  # posts after 5000 don't have to show up in the general display queries 
  enum pet_status: {
    draft: 5000, published: 200, sold: 4000, cancelled: 5200,
    billing: 20000, ready_for_fulfillment: 20200, fulfilling_processing: 20400,
    removed: 30000, suspended: 30200, banned: 30400 }
  # enum available: [:available, :unavailable]
  # enum visible: [:visible, :invisible]
  # enum published: [:published, :unpublished]
  
  belongs_to :pet_category
  belongs_to :location
  belongs_to :user_detail, inverse_of: :pets
  
  validates_presence_of :pet_category_id
  validates_presence_of :location_id

  # scope :owner, -> { where(user_detail_id: @user.user_detail.id)}
  # All pets not disabled by admin
  scope :visible_pets, -> { where(visible: true) }
  # All pets not disabled by admin + published
  scope :published, -> { where(published: true) }
  # All pets not disabled + published + not sold
  scope :available_pets, -> { published.where(available: true) }
  
  scope :for_sale, -> { where('pet_status < ?', 4000) }

end
