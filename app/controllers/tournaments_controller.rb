class TournamentsController < ApplicationController
	def new
		@event = Event.find params[:event_id]
		@tournament = Tournament.new
	end

	def create
		event = Event.find params[:event_id]
		tourney = Tournament.new params[:tournament]
		
		if tourney.save
			tourney.users << event.users
			event.tournaments << tourney
			redirect_to event_path event, notice: 'Event was successfully created with a tournament.'
		else
			render action: 'new'
		end
	end
end	