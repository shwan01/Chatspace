class ChangeColumnNullName < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :name, :string, null: false
    add_index :users, :name
  end
end
