class Event < ActiveRecord::Base
  attr_accessible :event_active, :event_date, :event_description, :event_game_title, :event_location, :event_name, :event_type_id, :event_zipcode
  
  has_many :groups
  has_many :groups_events, through: :events

	has_many :admins
  has_many :user_admins, through: :admins
	
  has_many :users
  has_many :user_events, through: :events

end
