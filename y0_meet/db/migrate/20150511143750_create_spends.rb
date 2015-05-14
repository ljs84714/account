class CreateSpends < ActiveRecord::Migration
  def change
    create_table :spends do |t|
      t.string :name
      t.string :info

      t.timestamps null: false
    end
  end
end
