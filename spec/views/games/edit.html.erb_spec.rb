require 'spec_helper'

describe "games/edit" do
  before(:each) do
    @game = assign(:game, stub_model(Game,
      :game_name => "MyString",
      :game_img_icon_url => "MyString",
      :game_img_logo_url => "MyString",
      :game_playtime_2weeks => 1,
      :game_playtime_forever => 1
    ))
  end

end
