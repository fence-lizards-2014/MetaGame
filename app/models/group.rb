class Group < ActiveRecord::Base
  attr_accessible :group_description, :group_logo_url, :group_name, :group_tagline
  
  has_many :users
  has_many :group_users, through: :users

	has_many :admins, class_name: "User"

  has_many :events
  has_many :group_events, through: :groups

  has_many :games
  validates :group_name, presence: true, uniqueness: true
  validates :group_description, presence: true
  validates :group_logo_url, presence: true
  validates :group_tagline, presence: true

end
