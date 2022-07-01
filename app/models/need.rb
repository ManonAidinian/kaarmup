class Need < ApplicationRecord
  belongs_to :charity
  has_many :good_actions
  has_many :companies, through: :good_actions

  NEED_CATEGORIES = ["Food", "School supply", "Medical supply", "Workforce", "IT Service", "Legal service", "Animal rescue", "Vehicule", "Premise/Room", "Textile", "Donation", "Household supply", "Consulting", "Other"]

  validates :title, :category, :karma_points, presence: true
  validates :category, inclusion: { in: NEED_CATEGORIES }

  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :category ],
    associated_against: {
      charity: [ :name, :category, :location ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
