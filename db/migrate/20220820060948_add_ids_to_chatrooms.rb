class AddIdsToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :requester_id, :integer,  null: false
    add_column :chatrooms, :requestee_id, :integer, null: false
  end


end
