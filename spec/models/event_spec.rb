require 'spec_helper'

describe Event do
	let!(:user) { FactoryGirl.create :user }
	# let!(:group) do

	# end
	let!(:event) do 
		event = FactoryGirl.create :event
		event.update_attributes user_id: user.id
	end

	context '#validations' do
		it { should validate_presence_of :event_name }
		it { should validate_presence_of :event_game_title }
		it { should validate_presence_of :event_description }
		it { should validate_presence_of :event_location }
		it { should validate_presence_of :event_zipcode }
		it { should allow_value(55555).for(:event_zipcode) }
		it { should validate_presence_of :event_date }
	end

	context '#associations' do
		xit { should have_many :groups }
		xit { should have_many(:groups_events).through(:events) }

		xit { should have_many :admins }
		xit { should have_many(:user_admins).through(:admins) }

		it { should have_many :users }
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
