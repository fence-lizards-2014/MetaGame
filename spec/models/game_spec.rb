require 'spec_helper'

describe Game do
	let!(:user) { FactoryGirl.create :user }
	let!(:game) { FactoryGirl.create :game }
	let!(:group) { FactoryGirl.create :group }
	before(:each) do 
		user.games << game
		group.games << game
	end
	
	context '#associations' do
		it 'game belongs to a user' do
			expect(user.games).to include game
		end

		it 'game belongs to a group' do
			expect(group.games).to include game
		end
	end

	context '#mass assignment' do
		it { should allow_mass_assignment_of :game_img_url }
		it { should allow_mass_assignment_of :game_name }
		it { should allow_mass_assignment_of :game_description }
		it { should allow_mass_assignment_of :game_playtime_2weeks }
		it { should allow_mass_assignment_of :game_playtime_forever }
	end
end
