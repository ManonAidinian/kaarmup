class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  TYPES = ["Company", "Charity"]

  validates :email, :password, :first_name, :last_name, :type, presence: true
  validates :email, uniqueness: true
  validates :type, inclusion: { in: TYPES }
end
