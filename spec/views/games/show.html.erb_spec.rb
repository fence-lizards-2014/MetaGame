require 'spec_helper'

describe "games/show" do
  before(:each) do
    @game = assign(:game, stub_model(Game,
      :game_name => "Game Name",
      :game_img_icon_url => "Game Img Icon Url",
      :game_img_logo_url => "Game Img Logo Url",
      :game_playtime_2weeks => 1,
      :game_playtime_forever => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Game Name/)
    rendered.should match(/Game Img Icon Url/)
    rendered.should match(/Game Img Logo Url/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
