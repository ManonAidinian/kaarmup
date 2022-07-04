class ChangeStatustoNeeds < ActiveRecord::Migration[6.1]
  def change
    change_column :needs, :status, :string, default: "Needed"
  end
end
