class User < ActiveRecord::Base
  attr_accessible :password_hash, :user_bio, :user_email, :user_name, :user_zipcode
end
