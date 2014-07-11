class GroupGame < ActiveRecord::Base
	belongs_to :game 
	belongs_to :group
end