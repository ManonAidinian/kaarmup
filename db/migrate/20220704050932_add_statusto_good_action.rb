class AddStatustoGoodAction < ActiveRecord::Migration[6.1]
  def change
    add_column :good_actions, :status, :string
  end
end
