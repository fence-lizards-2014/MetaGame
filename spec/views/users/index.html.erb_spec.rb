require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :username => "User Name",
        :password_hash => "Password Hash",
        :user_email => "User Email",
        :user_bio => "MyText",
        :user_zipcode => 1
      ),
      stub_model(User,
        :username => "User Name",
        :password_hash => "Password Hash",
        :user_email => "User Email",
        :user_bio => "MyText",
        :user_zipcode => 1
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "Password Hash".to_s, :count => 2
    assert_select "tr>td", :text => "User Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
