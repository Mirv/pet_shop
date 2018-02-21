class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :user_detail, inverse_of: :user

  # validates_presence_of :email
  # validates_presence_of :encrypted_password
end
