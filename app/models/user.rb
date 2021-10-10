class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :property_reservations
  has_many :properties, through: :property_reservations
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
