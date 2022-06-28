class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  USER_TYPES = ["Company", "Charity"]

  validates :first_name, :last_name, :user_type, presence: true, on: :update
  validates :user_type, inclusion: { in: USER_TYPES }, on: :update

  has_many :charities, dependent: :destroy
  has_many :companies, dependent: :destroy
  has_one_attached :photo
end
