FactoryGirl.define do
 factory :tournament do
		tourney_name { Faker::Lorem.word }
		tourney_rules { Faker::Lorem.sentence }
		tourney_max_players { Faker::Number.number(2) }
	end
end