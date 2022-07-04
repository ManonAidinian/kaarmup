class Need < ApplicationRecord
  belongs_to :charity
  has_many :good_actions
  has_many :companies, through: :good_actions

  validates :title, :category, :karma_points, presence: true

  has_many_attached :photos
end
