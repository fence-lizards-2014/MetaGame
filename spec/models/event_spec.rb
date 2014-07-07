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
		xit { should have_many :groups }
		xit { should have_many(:groups_events).through(:events) }

		xit { should have_many :admins }
		xit { should have_many(:user_admins).through(:admins) }

		xit { should have_many :users }
		xit { should have_many(:user_events).through(:events) }
	end

	context '#mass assignment' do
		it { should allow_mass_assignment_of :event_active }
		it { should allow_mass_assignment_of :event_date }
		it { should allow_mass_assignment_of :event_description }
		it { should allow_mass_assignment_of :event_game_title }
		it { should allow_mass_assignment_of :event_location }
		it { should allow_mass_assignment_of :event_name }
		it { should allow_mass_assignment_of :event_type_id }
		it { should allow_mass_assignment_of :event_zipcode }
	end
end
