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

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_username[name=?]", "user[username]"
      assert_select "input#user_password_hash[name=?]", "user[password_hash]"
      assert_select "input#user_user_email[name=?]", "user[user_email]"
      assert_select "textarea#user_user_bio[name=?]", "user[user_bio]"
      assert_select "input#user_user_zipcode[name=?]", "user[user_zipcode]"
    end
  end
end
