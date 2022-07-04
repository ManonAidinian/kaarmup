class Need < ApplicationRecord
  belongs_to :charity
  has_many :good_actions
  has_many :companies, through: :good_actions, dependent: :destroy

  validates :title, :category, :karma_points, :status, presence: true

  has_many_attached :photos
end
