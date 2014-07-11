require 'spec_helper'

describe TournamentsController do
	let!(:user) { FactoryGirl.create :user }
	let!(:event) { FactoryGirl.create :event }
	let(:valid_attributes) { { tourney_name: "Valid", tourney_rules: "Win", tourney_max_players: 10 } }

	context 'GET #new' do
		it 'renders the tournament new template' do
			get :new, event_id: event
			expect(response).to render_template :new
		end
	end
	
end