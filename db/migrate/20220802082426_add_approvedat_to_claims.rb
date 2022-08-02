class AddApprovedatToClaims < ActiveRecord::Migration[6.1]
  def change
    add_column :claims, :approved_at, :datetime
  end
end
