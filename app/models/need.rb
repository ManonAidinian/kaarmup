class Need < ApplicationRecord
  belongs_to :charity
  has_many :claims
  has_many :companies, through: :claims, dependent: :destroy

  validates :title, :category, :karma_points, :status, presence: true
  validates :karma_points, inclusion: { in: (5..50), message: " award must be between 5 and 50" }

  has_many_attached :photos
end
