class CreateTournaments < ActiveRecord::Migration
  def change 
  	create_table :tournaments do |t|
  		t.string :tourney_name
  		t.text :tourney_rules
  		t.integer :tourney_max_players
  		t.boolean :winner, default: false

  		t.belongs_to :event
  		t.belongs_to :game
  	end
  end
end
