class CreateUserHairStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_hair_styles do |t|
      t.references :user, foreign_key: true
      t.references :hair_style, foreign_key: true

      t.timestamps
    end
  end
end
