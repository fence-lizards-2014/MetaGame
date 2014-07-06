require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :event_name => "MyString",
      :event_game_title => "MyString",
      :event_description => "MyString",
      :event_location => "MyString",
      :event_active => false,
      :event_type_id => 1,
      :event_zipcode => 1
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", events_path, "post" do
      assert_select "input#event_event_name[name=?]", "event[event_name]"
      assert_select "input#event_event_game_title[name=?]", "event[event_game_title]"
      assert_select "input#event_event_description[name=?]", "event[event_description]"
      assert_select "input#event_event_location[name=?]", "event[event_location]"
      assert_select "input#event_event_active[name=?]", "event[event_active]"
      assert_select "input#event_event_type_id[name=?]", "event[event_type_id]"
      assert_select "input#event_event_zipcode[name=?]", "event[event_zipcode]"
    end
  end
end
