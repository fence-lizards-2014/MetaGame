require 'spec_helper'

describe User do
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
		it { should have_many(:friends).through(:user_friends) }

		it { should have_many :games }
		xit { should have_many(:user_games).through(:games) }

		it { should have_many :groups }
		xit { should have_many(:user_groups).through(:groups) }

		it { should have_many :events }

		xit { should have_many(:user_events).through(:events) }
		xit { should have_many(:group_events).through(:events) }
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
