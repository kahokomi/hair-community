class CreateCommunicationStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :communication_styles do |t|
      t.string :name

      t.timestamps
    end
  end
end
