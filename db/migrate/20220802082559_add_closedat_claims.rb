class AddClosedatClaims < ActiveRecord::Migration[6.1]
  def change
    add_column :claims, :closed_at, :datetime
  end
end
