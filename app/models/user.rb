class User < ActiveRecord::Base
  attr_accessible :password_hash, :user_bio, :user_email, :username, :user_zipcode, :user_steam_id, :user_avatar_url, :id, :created_at, :updated_at

	has_many :user_friends
	has_many :friends, through: :user_friends, source: :user, class_name: "User"

  has_many :games
	has_many :user_games, through: :games

	has_many :groups
  has_many :user_groups, through: :groups
	
  has_many :events
  has_many :user_events, through: :events
  has_many :group_events, through: :events



  include BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end