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

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Group Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Group Logo Url/)
    rendered.should match(/Group Tagline/)
  end
end
