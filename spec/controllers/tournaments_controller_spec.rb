require 'spec_helper'

describe TournamentsController do
	let!(:user) { FactoryGirl.create :user }
	let!(:event) { FactoryGirl.create :event }

	context 'GET #new' do
		it 'renders the tournament new template' do
			get :new, event_id: event
			expect(response).to render_template :new
		end
	end

	context 'POST #create' do
		it 'should increase the database count by 1 if valid params' do
			expect {
				post :create, event_id: event, tournament: { tourney_name: "Tourney", tourney_rules: "Win", tourney_max_players: 10 }
			}.to change { Tournament.count }.by(1)
		end
	end
	
end