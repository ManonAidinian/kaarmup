class Charity < ApplicationRecord
  belongs_to :user
  has_many :needs, dependent: :destroy

  validates :name, :description, :location, presence: true

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_globally,
    against: [ :name, :location ],
    associated_against: {
      needs: [ :title ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
