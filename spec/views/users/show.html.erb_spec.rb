require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :username => "User Name",
      :password_hash => "Password Hash",
      :user_email => "User Email",
      :user_bio => "MyText",
      :user_zipcode => 1
    ))
  end
end
