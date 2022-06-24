class Company < ApplicationRecord
  belongs_to :user
  has_many :good_actions
  has_many :needs, through: :good_actions

  validates :name, :location, presence: true
end
