class ChangeKarmapointstoCompanies < ActiveRecord::Migration[6.1]
  def change
    change_column :companies, :total_karma_points, :integer, default: 0
  end
end
