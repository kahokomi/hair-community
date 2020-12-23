class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :sex, :string
    add_column :users, :age, :integer
    add_column :users, :year, :integer
    add_column :users, :hair_salon, :string
    add_column :users, :job, :string
    add_column :users, :introduction, :text
    add_column :users, :image_id, :string
  end
end
