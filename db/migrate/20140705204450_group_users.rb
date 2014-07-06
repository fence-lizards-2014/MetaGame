class GroupUsers < ActiveRecord::Migration
  def change
  	create_table :group_users, id: false do |t|
  		t.integer :group_id
  		t.integer :user_id
  	end
  end
end
