class UserAdmins < ActiveRecord::Migration
  def change
  	create_table :user_admins, id: false do |t|
  		t.integer :user_id
  		t.integer :group_id
  		t.integer :event_id
  		t.boolean :admin
  	end
  end
end
