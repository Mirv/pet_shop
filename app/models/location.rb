class Location < ApplicationRecord
  enum location_status: { 
  closed: 10, open: 20, out_of_business: 30, 
  suspended: 110, shutdown: 120 }
  
  has_many :pets
  belongs_to :user_detail
end
