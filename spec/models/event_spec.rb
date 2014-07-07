require 'spec_helper'

describe Event do
	context '#validations' do
		xit { should validate_presence_of :event_name }
		xit { should validate_presence_of :event_game_title }
		xit { should validate_presence_of :event_description }
		xit { should validate_presence_of :event_location }
		xit { should validate_presence_of :zipcode }
		xit { should allow_value(55555).for(:user_zipcode) }
	end
end
