require 'spec_helper'

describe User do
	let!(:user) { FactoryGirl.create :user }
  let!(:friend) { User.create("username" => "dominate", "password_hash" => "Sdndk23@4(", "confirm_pw" => "Sdndk23@4(", "user_email" => "exe@gmail.com", "user_zipcode" => 54321) }  
	let!(:game) { FactoryGirl.create :game }
	let!(:group) { FactoryGirl.create :group }
	let!(:event) { FactoryGirl.create :event }
	context '#validations' do
		it { should validate_uniqueness_of :username }
		it { should validate_presence_of :username }
		it { should validate_presence_of :password_hash }
		it { should ensure_length_of(:password_hash).is_at_least(8)
                                         .with_message(/Password must be at least 8 characters long./) }
    it { should allow_value('Ex123#45').for(:password_hash) }
    it { should validate_uniqueness_of :user_email }
    it { should validate_presence_of :user_email }
    it { should allow_value('example@gmail.com').for(:username) }
    it { should allow_value(55555).for(:user_zipcode) }
	end

	context '#associations' do
		it { should have_many :user_friends }
		it { should have_many :friends }

		it 'user can add a friend to their friend list via has many' do
			expect {
				user.friends << friend
			}.to change{ user.friends.length }.by(1)
		end

		it { should have_many :games }
		it 'user can add a game to the game list' do
			expect {
				user.games << game
			}.to change{ user.games.size }.by(1)
		end

		it { should have_many :events }

		it { should have_many :groups }
		it 'user can add a group to the group list' do
			expect {
				user.groups << group
			}.to change{ user.groups.size }.by(1)
		end

		it 'user can add an event to their event list' do
			expect {
				user.events << event
			}.to change{ user.events.size }.by(1)
		end
	end

	context '#mass assignment' do
		it { should allow_mass_assignment_of :username }
		it { should allow_mass_assignment_of :password_hash }
		it { should allow_mass_assignment_of :user_bio }
		it { should allow_mass_assignment_of :user_email }
		it { should allow_mass_assignment_of :user_zipcode }
		it { should allow_mass_assignment_of :user_steam_id }
		it { should allow_mass_assignment_of :user_avatar_url }
		it { should allow_mass_assignment_of :id }
		it { should allow_mass_assignment_of :created_at }
		it { should allow_mass_assignment_of :updated_at }
	end
end
