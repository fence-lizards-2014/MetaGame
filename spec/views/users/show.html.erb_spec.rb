require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :user_name => "User Name",
      :password_hash => "Password Hash",
      :user_email => "User Email",
      :user_bio => "MyText",
      :user_zipcode => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User Name/)
    rendered.should match(/Password Hash/)
    rendered.should match(/User Email/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
