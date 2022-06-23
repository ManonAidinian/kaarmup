class CreateGoodActions < ActiveRecord::Migration[6.1]
  def change
    create_table :good_actions do |t|
      t.references :company, null: false, foreign_key: true
      t.references :need, null: false, foreign_key: true

      t.timestamps
    end
  end
end