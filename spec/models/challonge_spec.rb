require 'spec_helper'
require 'ostruct'


describe ChallongeAdapter do 

URLHEX = 'jk23kjflk4'
TOURNAMENT_NAME = 'testtourney'	

	
	context 'when posting a new tournament' do
		let(:post_return) { ChallongeAdapter.new(TOURNAMENT_NAME, URLHEX).create_tournament}

		before(:each) do
			allow_any_instance_of(ChallongeAdapter).to receive(:create_tournament).and_return(OpenStruct.new created_by_api: true, url: URLHEX )
		end
		
		it 'should know that the api created the tournament' do
			expect(post_return.created_by_api).to eq true
		end
	end

	context 'when adding a participant' do
		let(:add_person) { ChallongeAdapter.new(TOURNAMENT_NAME, URLHEX).add_participant('gary') }

		before(:each) do
			allow_any_instance_of(ChallongeAdapter).to receive(:add_participant).and_return(OpenStruct.new participant_name: 'gary')
		end

		it 'makes the participant part of the tournament' do
			expect(add_person.participant_name).to eq 'gary'
		end
	end

	context 'when starting a tournament' do
		let(:starter) {ChallongeAdapter.new(TOURNAMENT_NAME, URLHEX).start_tournament}

		before(:each) do
			allow_any_instance_of(ChallongeAdapter).to receive(:start_tournament).and_return(OpenStruct.new started_at: 'time_object')
		end

		it 'starts the tournament so that the started_at field is not null' do
			expect(starter.started_at).to eq 'time_object'
		end
	end
end