require 'spec_helper'

describe Event do
	let!(:event) { FactoryGirl.create :event }
	context '#validations' do
		xit { should validate_presence_of :event_name }
		xit { should validate_presence_of :event_game_title }
		xit { should validate_presence_of :event_description }
		xit { should validate_presence_of :event_location }
		xit { should validate_presence_of :event_zipcode }
		xit { should allow_value(55555).for(:event_zipcode) }

		it 'event created with valid date' do
			expect(event.event_date).to eq '3/3/2060'
		end
	end

	context '#associations' do

	end
end
