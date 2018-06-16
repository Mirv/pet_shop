class UserDetail < ApplicationRecord
  belongs_to :user, inverse_of: :user_detail
  has_many :pets, inverse_of: :user_detail
  has_many :locations
  
  validates_presence_of :name
  validates_presence_of :user_id
end
