class RemoveColumnFromChats < ActiveRecord::Migration[5.2]
  def change
    remove_column :chats, :integer, :string
  end
end
