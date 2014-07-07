require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :event_name => "MyString",
      :event_game_title => "MyString",
      :event_description => "MyString",
      :event_location => "MyString",
      :event_active => false,
      :event_type_id => 1,
      :event_zipcode => 1
    ))
  end

end
