require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :event_name => "Event Name",
      :event_game_title => "Event Game Title",
      :event_description => "Event Description",
      :event_location => "Event Location",
      :event_active => false,
      :event_type_id => 1,
      :event_zipcode => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Event Name/)
    rendered.should match(/Event Game Title/)
    rendered.should match(/Event Description/)
    rendered.should match(/Event Location/)
    rendered.should match(/false/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
