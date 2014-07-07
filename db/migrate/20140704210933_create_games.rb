class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_name
      t.text :game_description
      t.text :game_img_url
      t.text :game_icon_url
      t.integer :game_steam_appid
      t.integer :game_playtime_2weeks
      t.integer :game_playtime_forever

      t.belongs_to :user
      t.belongs_to :group
      t.timestamps
    end
  end
end
