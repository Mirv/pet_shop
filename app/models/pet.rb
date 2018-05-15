class Pet < ApplicationRecord
  # Alternatively could do mod 1000, 100, 10, 1 for visibility ... 
  # ... anything ending in 0 is invisible, 1 is visible on index to every, ...
  # ... 2 owner, 3 mod, 4 admin.   Then the range actual value is progression ...
  # ... thru the life cycle
  #
  # - Current status
  # first 10,000 are user status, 20k's are business status, 30k's are anti-troll
  # posts after 5000 don't have to show up in the general display queries 
  enum pet_status: {
    draft: 5000, published: 200, sold: 4000, cancelled: 5200,
    billing: 20000, ready_for_fulfillment: 20200, fulfilling_processing: 20400,
    removed: 30000, suspended: 30200, banned: 30400 }

  belongs_to :pet_category
  belongs_to :location
  belongs_to :user_detail, inverse_of: :pets
  
  validates_presence_of :name
  validates_presence_of :pet_category_id
  validates_presence_of :location_id

  scope :transactions,  -> { where('pet_status = ?', 4000) }
  scope :drafts,        -> { where('pet_status = ?', 4000) }
end
