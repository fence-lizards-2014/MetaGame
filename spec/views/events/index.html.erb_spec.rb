require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :event_name => "Event Name",
        :event_game_title => "Event Game Title",
        :event_description => "Event Description",
        :event_location => "Event Location",
        :event_active => false,
        :event_type_id => 1,
        :event_zipcode => 2
      ),
      stub_model(Event,
        :event_name => "Event Name",
        :event_game_title => "Event Game Title",
        :event_description => "Event Description",
        :event_location => "Event Location",
        :event_active => false,
        :event_type_id => 1,
        :event_zipcode => 2
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Event Name".to_s, :count => 2
    assert_select "tr>td", :text => "Event Game Title".to_s, :count => 2
    assert_select "tr>td", :text => "Event Description".to_s, :count => 2
    assert_select "tr>td", :text => "Event Location".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
