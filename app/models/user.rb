class User < ActiveRecord::Base
  attr_accessible :password_hash, :user_bio, :user_email, :user_name, :user_zipcode, :user_steam_id
  


  has_many :games
	has_many :games, through: :user_games

	has_many :groups
  has_many :groups, through: :user_groups
	
  has_many :events
  has_many :events, through: :user_events
  has_many :events, through: :group_events



  include BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end


  has_many :posts, through: :readings
