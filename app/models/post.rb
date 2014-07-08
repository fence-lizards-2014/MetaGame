class Post < ActiveRecord::Base
	attr_accessible :post_content
	validates :post_content, presence: true
end