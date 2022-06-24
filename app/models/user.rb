class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  TYPES = ["Company", "Charity"]

  validates :first_name, :last_name, :type, presence: true, on: :update
  validates :type, inclusion: { in: TYPES }, on: :update

  has_many :charities, dependent: :destroy
  has_many :companies, dependent: :destroy
  has_one_attached :photo
end
