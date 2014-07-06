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

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_username[name=?]", "user[username]"
      assert_select "input#user_password_hash[name=?]", "user[password_hash]"
      assert_select "input#user_user_email[name=?]", "user[user_email]"
      assert_select "textarea#user_user_bio[name=?]", "user[user_bio]"
      assert_select "input#user_user_zipcode[name=?]", "user[user_zipcode]"
    end
  end
end
