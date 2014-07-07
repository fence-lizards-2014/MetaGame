require 'spec_helper'

describe Game do
	context '#validations' do

	end

	context '#associations' do
		xit { should have_many :users }
		xit { should have_many(:user_games).through(:users) }

		xit { should have_many :groups }
		xit { should have_many(:group_games).through(:groups) }
	end

	context '#mass assignment' do
		it { should allow_mass_assignment_of :game_img_url }
		it { should allow_mass_assignment_of :game_name }
		it { should allow_mass_assignment_of :game_description }
		it { should allow_mass_assignment_of :game_playtime_2weeks }
		it { should allow_mass_assignment_of :game_playtime_forever }
	end
end
