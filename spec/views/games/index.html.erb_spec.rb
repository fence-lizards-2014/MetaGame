require 'spec_helper'

describe "games/index" do
  before(:each) do
    assign(:games, [
      stub_model(Game,
        :game_name => "Game Name",
        :game_img_icon_url => "Game Img Icon Url",
        :game_img_logo_url => "Game Img Logo Url",
        :game_playtime_2weeks => 1,
        :game_playtime_forever => 2
      ),
      stub_model(Game,
        :game_name => "Game Name",
        :game_img_icon_url => "Game Img Icon Url",
        :game_img_logo_url => "Game Img Logo Url",
        :game_playtime_2weeks => 1,
        :game_playtime_forever => 2
      )
    ])
  end
end
