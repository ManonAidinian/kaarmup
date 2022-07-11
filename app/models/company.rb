class Company < ApplicationRecord
  belongs_to :user
  has_many :good_actions
  has_many :needs, through: :good_actions, dependent: :destroy

  validates :name, :location, presence: true
  has_many_attached :photos
end
