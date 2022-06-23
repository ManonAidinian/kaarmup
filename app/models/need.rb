class Need < ApplicationRecord
  belongs_to :charity
  has_many :companies, through: :good_action
end
