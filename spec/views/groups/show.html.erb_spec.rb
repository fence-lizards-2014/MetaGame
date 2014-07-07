require 'spec_helper'

describe "groups/show" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :group_name => "Group Name",
      :group_description => "MyText",
      :group_logo_url => "Group Logo Url",
      :group_tagline => "Group Tagline"
    ))
  end
end
