require 'spec_helper'

describe Group do
	let!(:user) { FactoryGirl.create :user }
  let!(:friend) { User.create("username" => "dominate", "password_hash" => "Sdndk23@4(", "confirm_pw" => "Sdndk23@4(", "user_email" => "exe@gmail.com", "user_zipcode" => 54321) }  
	let!(:game) { FactoryGirl.create :game }
	let!(:group) { FactoryGirl.create :group }
	let!(:event) { FactoryGirl.create :event }

	context '#validations' do
		it { should validate_presence_of :group_name }
		it { should validate_uniqueness_of :group_name }
		it { should validate_presence_of :group_description }
		it { should validate_presence_of :group_logo_url }
		it { should validate_presence_of :group_tagline }
	end

	before(:each) do 
		group.users << user
		group.events << event
		group.games << game
	end

	context '#associations' do
		it 'group has many users' do
			expect(group.users).to include user
		end

		it 'group has many events' do
			expect(group.events).to include event
		end

		it 'group has many games' do
			expect(group.games).to include game
		end

		it { should have_many :users }
		it { should have_many :admins }
		it { should have_many :events }
		it { should have_many :games }
	end

	context '#mass assignment' do
		it { should allow_mass_assignment_of :group_description }
		it { should allow_mass_assignment_of :group_logo_url }
		it { should allow_mass_assignment_of :group_name }
		it { should allow_mass_assignment_of :group_tagline }
	end
end
