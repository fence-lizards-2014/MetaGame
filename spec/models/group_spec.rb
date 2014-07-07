require 'spec_helper'

describe Group do
	context '#validations' do
		it { should validate_presence_of :group_name }
		it { should validate_uniqueness_of :group_name }
		it { should validate_presence_of :group_description }
		it { should validate_presence_of :group_logo_url }
		it { should validate_presence_of :group_tagline }
	end

	context '#associations' do
		it { should have_many :users }
		xit { should have_many(:group_users).through(:users) }

		it { should have_many :admins }

		it { should have_many :events }
		xit { should have_many(:group_events).through(:groups) }
	end
end
