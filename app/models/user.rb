class User < ActiveRecord::Base

  attr_accessible :password_hash, :user_bio, :user_email, :username, :user_zipcode, :user_steam_id, :user_avatar_url, :id, :created_at, :updated_at, :confirm_pw
  attr_accessor :confirm_pw

	has_many :user_friends
	has_many :friends, through: :user_friends, source: :user, class_name: "User"

  has_many :games
	has_many :user_games, through: :games

	has_many :groups
  has_many :user_groups, through: :groups

  has_many :events
  has_many :user_events, through: :events
  has_many :group_events, through: :events

  validates :username, presence: true, uniqueness: true
  validates :password_hash, length: { minimum: 8, message: "Password must be at least 8 characters long." }, format: { with: /^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$/,
            message: "Must contain at least one upper and lower case, one number, and one special character." }, presence: true

  validates :user_email, presence: true, uniqueness: true, format: { with: /^\S+@\S+\.\S+$/, message: "Must be a valid email." }

  validates :user_zipcode, format: { with: /(^\d{5}$)|(^\d{5}-\d{4}$)/, message: "Must be a valid US zip code." }, length: { is: 5, message: "Must be 5 digits." }

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
