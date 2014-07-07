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

end
