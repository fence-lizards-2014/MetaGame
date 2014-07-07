require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :username => "MyString",
      :password_hash => "MyString",
      :user_email => "MyString",
      :user_bio => "MyText",
      :user_zipcode => 1
    ))
  end

end
