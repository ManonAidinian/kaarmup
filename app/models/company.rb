class Company < ApplicationRecord
  belongs_to :user
  has_many :claims
  has_many :needs, through: :claims, dependent: :destroy

  validates :name, :location, presence: true
  has_many_attached :photos
end
