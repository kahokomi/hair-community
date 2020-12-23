class ChangeColumnToUser3 < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :name, :string, null: false
    change_column :users, :year, :integer, null: false
    change_column :users, :hair_salon, :string, null: false
    change_column :users, :job, :string, null: false
  end
end
