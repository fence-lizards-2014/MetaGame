class Group < ActiveRecord::Base
  attr_accessible :group_description, :group_logo_url, :group_name, :group_tagline
  
  has_many :users
  has_many :group_users, through: :users

	has_many :admins, class_name: "User"

  has_many :events
  has_many :group_events, through: :groups

end
