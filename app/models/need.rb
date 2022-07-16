class Need < ApplicationRecord
  belongs_to :charity
  has_many :claims
  has_many :companies, through: :claims, dependent: :destroy

  validates :title, :category, :karma_points, :status, presence: true

  has_many_attached :photos
end
