class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.integer :user_id, null: false
      t.text :body, null: false
      t.string :image_id
      t.timestamps
    end
  end
end
