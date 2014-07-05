class Group < ActiveRecord::Base
  attr_accessible :group_description, :group_logo_url, :group_name, :group_tagline
  has_many :users
  has_many :events
end
