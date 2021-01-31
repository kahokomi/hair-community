class CreateUserCommunicationStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_communication_styles do |t|
      t.references :user, foreign_key: true
      t.references :communication_style, foreign_key: true

      t.timestamps
    end
  end
end
