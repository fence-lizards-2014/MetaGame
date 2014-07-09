FactoryGirl.define do
 factory :post do
		post_content { Faker::Lorem.sentence }
	end
end