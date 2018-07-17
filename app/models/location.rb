class Location < ApplicationRecord
  enum location_status: { 
  closed: 10, open: 20, out_of_business: 30, 
  suspended: 110, shutdown: 120 }
  
  has_many :pets
  belongs_to :user_detail
  
  validates_presence_of :location_status
  validates_presence_of :user_detail_id
  validates_presence_of :name
  validates_presence_of :xcoordinate
  validates_presence_of :ycoordinate
end
