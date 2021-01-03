class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :is_hairdresser, :boolean, default: false, null: false
  end
end
