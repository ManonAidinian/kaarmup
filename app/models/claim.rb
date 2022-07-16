class Claim < ApplicationRecord
  belongs_to :company
  belongs_to :need
end
