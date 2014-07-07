FactoryGirl.define do
 factory :group do
		group_name { Faker::Lorem.word }
		group_description { Faker::Lorem.sentence }
		group_logo_url { Faker::Lorem.word }
		group_tagline { Faker::Lorem.sentence }
	end
end
