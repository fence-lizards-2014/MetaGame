FactoryGirl.define do
 factory :event do
		event_name { Faker::Lorem.word }
		event_game_title { Faker::Lorem.word }
		event_description { Faker::Lorem.sentence }
		event_location { Faker::Lorem.word }
		event_zipcode { Faker::Address.zip_code }
		event_date { '3/3/2060' }
	end
end