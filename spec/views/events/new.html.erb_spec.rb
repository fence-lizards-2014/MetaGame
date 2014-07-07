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

end
