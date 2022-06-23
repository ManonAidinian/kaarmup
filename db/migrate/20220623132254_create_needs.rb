class CreateNeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :needs do |t|
      t.string :title
      t.text :description
      t.string :category
      t.integer :karma_points
      t.string :status
      t.references :charity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
