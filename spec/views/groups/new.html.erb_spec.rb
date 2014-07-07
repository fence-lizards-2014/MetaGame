require 'spec_helper'

describe "groups/new" do
  before(:each) do
    assign(:group, stub_model(Group,
      :group_name => "MyString",
      :group_description => "MyText",
      :group_logo_url => "MyString",
      :group_tagline => "MyString"
    ).as_new_record)
  end

end
