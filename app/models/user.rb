class User < ActiveRecord::Base
  attr_accessible :password_hash, :user_bio, :user_email, :user_name, :user_zipcode, :user_steam_id
  include BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
