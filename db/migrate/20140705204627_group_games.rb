class GroupGames < ActiveRecord::Migration
  def change
  	create_table :group_games, id: false do |t|
  		t.integer :group_id
  		t.integer :game_id
  	end
  end
end
