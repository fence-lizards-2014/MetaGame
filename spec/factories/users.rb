# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
 factory :user do
		username { Faker::Lorem.word }
		password_hash { 'Ax123@#$%123kdl' }
		user_email { Faker::Internet.email }
		user_bio { Faker::Lorem.sentence }
		user_zipcode { Faker::Address.zip_code }
	end
end
