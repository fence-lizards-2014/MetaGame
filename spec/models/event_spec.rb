require 'spec_helper'

describe Event do
	let!(:user) { FactoryGirl.create :user }
	let!(:group) { FactoryGirl.create :group }
	let!(:event) { FactoryGirl.create :event }

	context '#validations' do
		it { should validate_presence_of :event_name }
		it { should validate_presence_of :event_game_title }
		it { should validate_presence_of :event_description }
		it { should validate_presence_of :event_location }
		it { should validate_presence_of :event_zipcode }
		it { should allow_value(55555).for(:event_zipcode) }
		it { should validate_presence_of :event_date }
	end

	before(:each) do 
		event.users << user
		event.groups << group
	end

	context '#associations' do
		it 'event has many users' do
			expect(event.users).to include user
		end

		it 'event has many groups' do
			expect(event.groups).to include group
		end

		it { should have_many :users }
		it { should have_many :groups }
	end

	context '#mass assignment' do
		it { should allow_mass_assignment_of :event_active }
		it { should allow_mass_assignment_of :event_date }
		it { should allow_mass_assignment_of :event_description }
		it { should allow_mass_assignment_of :event_game_title }
		it { should allow_mass_assignment_of :event_location }
		it { should allow_mass_assignment_of :event_name }
		it { should allow_mass_assignment_of :event_type }
		it { should allow_mass_assignment_of :event_zipcode }
	end
end
