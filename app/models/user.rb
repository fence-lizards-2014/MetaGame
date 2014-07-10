require_relative 'steam_adapter'

class User < ActiveRecord::Base

  attr_accessible :password_hash, :user_bio, :user_email, :username, :user_zipcode, :user_steam_id, :user_avatar_url, :id, :created_at, :updated_at, :confirm_pw
  attr_accessor :confirm_pw

  has_private_messages

	has_many :user_friends
	has_many :friends, through: :user_friends, source: :user, class_name: "User"

  has_many :games
	has_many :user_games, through: :games

	has_many :groups
  has_many :user_groups, through: :groups

  has_many :user_events
  has_many :events, through: :user_events
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

  def parse_zip zipcode, radius
    zipgroup = Zipcode.new(zipcode).by_radius(radius).parsed_response
    ziparray = []
    zipgroup['zip_codes'].each {|zip| y << zip['zip_code'] }
    return ziparray
  end
  
  def self.check_steam_id(user, steam_id, image)
    if user.user_steam_id != steam_id
      user.update_attributes user_steam_id: steam_id, user_avatar_url: image
    else
      user.update_attributes user_avatar_url: image
    end
  end

  def self.make_api_data_calls steam_id
    { summary: (SteamAdapter.new(steam_id).get_player_summaries).parsed_response,
      games: (SteamAdapter.new(steam_id).get_games).parsed_response }
  end

end
