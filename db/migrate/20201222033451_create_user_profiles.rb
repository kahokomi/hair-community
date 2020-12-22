class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :sex
      t.integer :age
      t.integer :year, null: false
      t.string :hair_salon, null: false
      t.string :job, null: false
      t.text :introduction
      t.string :image_id
      t.timestamps
    end
  end
end
