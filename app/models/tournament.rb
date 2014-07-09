require_relative 'challonge_adapter'

class Tournament < ActiveRecord::Base
	attr_accessible :tourney_name, :tourney_rules, :tourney_max_players, :winner
	
	has_many :users	

	validates :tourney_name, presence: true
	validates :tourney_rules, presence: true
	validates :tourney_max_players, presence: true
end