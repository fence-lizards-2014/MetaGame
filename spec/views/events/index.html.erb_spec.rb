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

end
