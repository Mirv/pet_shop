class Location < ApplicationRecord
  has_many :pets
  belongs_to :user_detail
end
