class UserFriends < ActiveRecord::Migration
  def change
  	create_table :user_friends, id: false do |t|
  		t.integer :user_id
  		t.integer :friend_id
  		t.integer :admin_id
  	end
  end
end
