require 'securerandom'
class TournamentsController < ApplicationController
	def new
		@event = Event.find params[:event_id]
		@tournament = Tournament.new
	end

	def create
		event = Event.find params[:event_id]
		tourney = Tournament.new params[:tournament]
		tourney.tourney_url = SecureRandom.hex(8)
		challonge = ChallongeAdapter.new(tourney.tourney_name, tourney.tourney_url)
		if tourney.save
			challonge.create_tournament
			tourney.users << event.users
			event.tournaments << tourney
			redirect_to event_path event, notice: 'Event was successfully created with a tournament.'
		else
			render action: 'new'
		end
	end

	def start
		@tourney = Tournament.find(params[:id])
		challonge = ChallongeAdapter.new(@tourney.tourney_name, params[:url]).start_tournament
		redirect_to event_path(@tourney.event_id)
	end
end	