class Charity < ApplicationRecord
  belongs_to :user
  has_many :needs, dependent: :destroy

  validates :name, :description, :location, presence: true

  has_one_attached :photo

  # include PgSearch::Model
  # pg_search_scope :search_by_name_and_category_and_location,
  #   against: [ :name, :category, :location ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
end
