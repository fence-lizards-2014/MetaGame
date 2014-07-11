class Group < ActiveRecord::Base
  attr_accessible :group_description, :group_logo_url, :group_name, :group_tagline

  has_private_messages

  has_many :user_groups
  has_many :users, through: :user_groups

	has_many :admins, class_name: "User"

  has_many :events
  has_many :group_events, through: :groups

  has_many :group_games
  has_many :games, through: :group_games
  has_many :posts

  validates :group_name, presence: true, uniqueness: true
  validates :group_description, presence: true
  validates :group_logo_url, presence: true
  validates :group_tagline, presence: true

  def self.assign_user_to_group group, user
    group.users << user
    user.groups << group
  end

  def self.remove_user_to_group group, user
    group.users.delete user
    user.groups.delete group
  end

end
