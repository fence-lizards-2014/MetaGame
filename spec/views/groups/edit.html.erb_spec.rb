require 'spec_helper'

describe "groups/edit" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :group_name => "MyString",
      :group_description => "MyText",
      :group_logo_url => "MyString",
      :group_tagline => "MyString"
    ))
  end

end
