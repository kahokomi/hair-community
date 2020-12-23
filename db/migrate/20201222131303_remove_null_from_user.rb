class RemoveNullFromUser < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :name, :string, null: true
    change_column :users, :year, :integer, null: true
    change_column :users, :hair_salon, :string, null: true
    change_column :users, :job, :string, null: true
  end
  
  def down
    change_column :users, :name, :string, null: false
    change_column :users, :year, :integer, null: false
    change_column :users, :hair_salon, :string, null: false
    change_column :users, :job, :string, null: false
  end
end
