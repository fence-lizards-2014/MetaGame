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

  xit "replace with valid test" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Game Name".to_s, :count => 2
    assert_select "tr>td", :text => "Game Img Icon Url".to_s, :count => 2
    assert_select "tr>td", :text => "Game Img Logo Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
