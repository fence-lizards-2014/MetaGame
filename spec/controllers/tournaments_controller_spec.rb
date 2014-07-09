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
	
end