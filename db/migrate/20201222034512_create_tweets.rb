class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.references :user, foreign_key: true
      t.text :body, null: false
      t.string :image_id
      t.timestamps
    end
  end
end
