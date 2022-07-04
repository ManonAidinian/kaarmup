class RemoveCategoryFromCharities < ActiveRecord::Migration[6.1]
  def change
    remove_column :charities, :category, :string
  end
end
