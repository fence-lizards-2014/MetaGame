# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    user_name "MyString"
    password_hash "MyString"
    user_email "MyString"
    user_bio "MyText"
    user_zipcode 1
  end
end
