class Charity < ApplicationRecord
  belongs_to :user
  has_many :needs, dependent: :destroy

  validates :name, :description, :location, presence: true
end