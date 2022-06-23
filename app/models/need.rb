class Need < ApplicationRecord
  belongs_to :charity
  has_many :companies, through: :good_action

  NEED_CATEGORIES = ["Food", "School supply", "Medical supply", "Workforce", "IT Service", "Legal service", "Vehicule", "Premise/Room", "Textile", "Donation", "Household supply", "Consulting", "Other"]

  validates :title, :category, :karma_points, presence: true
  validates :category, inclusion: { in: NEED_CATEGORIES }
end
