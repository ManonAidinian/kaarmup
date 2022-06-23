class Company < ApplicationRecord
  belongs_to :user
  has_many :needs, through: :good_action

  validates :name, :location, presence: true
end
