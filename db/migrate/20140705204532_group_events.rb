class GroupEvents < ActiveRecord::Migration
  def change
  	create_table :group_events, id: false do |t|
  		t.integer :group_id
  		t.integer :event_id
  	end
  end
end
