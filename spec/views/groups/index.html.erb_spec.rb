require 'spec_helper'

describe "groups/index" do
  before(:each) do
    assign(:groups, [
      stub_model(Group,
        :group_name => "Group Name",
        :group_description => "MyText",
        :group_logo_url => "Group Logo Url",
        :group_tagline => "Group Tagline"
      ),
      stub_model(Group,
        :group_name => "Group Name",
        :group_description => "MyText",
        :group_logo_url => "Group Logo Url",
        :group_tagline => "Group Tagline"
      )
    ])
  end

end
