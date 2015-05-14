class AddAccountIdToSpends < ActiveRecord::Migration
  def change
    add_column :spends, :account_id, :integer
  end
end
