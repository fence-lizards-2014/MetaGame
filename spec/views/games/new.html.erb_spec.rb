require 'spec_helper'

describe "games/new" do
  before(:each) do
    assign(:game, stub_model(Game,
      :game_name => "MyString",
      :game_img_icon_url => "MyString",
      :game_img_logo_url => "MyString",
      :game_playtime_2weeks => 1,
      :game_playtime_forever => 1
    ).as_new_record)
  end

  it "renders new game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", games_path, "post" do
      assert_select "input#game_game_name[name=?]", "game[game_name]"
      assert_select "input#game_game_img_icon_url[name=?]", "game[game_img_icon_url]"
      assert_select "input#game_game_img_logo_url[name=?]", "game[game_img_logo_url]"
      assert_select "input#game_game_playtime_2weeks[name=?]", "game[game_playtime_2weeks]"
      assert_select "input#game_game_playtime_forever[name=?]", "game[game_playtime_forever]"
    end
  end
end
