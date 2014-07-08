class TournamentsController < ApplicationController
	def new
		@event = Event.find params[:event_id]
		@tournament = Tournament.new
	end

	def create
		p params
		event = Event.find 27
		redirect_to event_path event
	end
end	