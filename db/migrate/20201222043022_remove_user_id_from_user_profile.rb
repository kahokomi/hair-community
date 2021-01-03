class RemoveUserIdFromUserProfile < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_profiles, :user_id, :integer
  end
end
