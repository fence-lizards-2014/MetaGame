class TournamentsController < ApplicationController
	def new
		p 'wassabe'
		@tournament = Tournament.new
	end

	def create
		# @tournament = Tournament.new params[:tournament]
		p params
		"You are at a route"
	end
end	