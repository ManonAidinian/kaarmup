class RenameGoodactionToClaim < ActiveRecord::Migration[6.1]

    def change
      rename_table :good_actions, :claims
    end
end
