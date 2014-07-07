require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :username => "MyString",
      :password_hash => "MyString",
      :user_email => "MyString",
      :user_bio => "MyText",
      :user_zipcode => 1
    ).as_new_record)
  end

end
