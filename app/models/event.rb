class Event < ActiveRecord::Base
  attr_accessible :event_active, :event_date, :event_description, :event_game_title, :event_location, :event_name, :event_type_id, :event_zipcode
  
  has_many :groups
  has_many :groups_events, through: :events

	has_many :admins
  has_many :user_admins, through: :admins
	
  has_many :users
  has_many :user_events, through: :events

  validates :event_name, presence: true
  validates :event_game_title, presence: true
  validates :event_description, presence: true
  validates :event_location, presence: true
  validates :event_zipcode, presence: true, format: { with: /(^\d{5}$)|(^\d{5}-\d{4}$)/, 
  																				message: "Must be a valid US zip code." }, length: 
  																				{ is: 5, message: "Must be 5 digits." }
  validates :valid_date?, presence: true

  def valid_date?
  	if event_date < Date.today
      errors.add(:date, "date can't be in the past")
    end
  end

end
