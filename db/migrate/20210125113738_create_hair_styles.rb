class CreateHairStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :hair_styles do |t|
      t.string :name

      t.timestamps
    end
  end
end
