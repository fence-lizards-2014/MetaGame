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

  it "renders the edit group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", group_path(@group), "post" do
      assert_select "input#group_group_name[name=?]", "group[group_name]"
      assert_select "textarea#group_group_description[name=?]", "group[group_description]"
      assert_select "input#group_group_logo_url[name=?]", "group[group_logo_url]"
      assert_select "input#group_group_tagline[name=?]", "group[group_tagline]"
    end
  end
end
