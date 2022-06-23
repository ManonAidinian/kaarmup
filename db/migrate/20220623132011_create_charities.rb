class CreateCharities < ActiveRecord::Migration[6.1]
  def change
    create_table :charities do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
