class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_name
      t.string :game_img_icon_url
      t.string :game_img_logo_url
      t.integer :game_steam_appid
      t.integer :game_playtime_2weeks
      t.integer :game_playtime_forever

      t.belongs_to :user
      t.belongs_to :group
      t.timestamps
    end
  end
end
