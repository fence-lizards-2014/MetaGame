class CreatePosts < ActiveRecord::Migration
  create_table :posts do |p|
  	p.text :post_content
  	p.belongs_to :group
  	p.belongs_to :user
  	p.timestamps
  end
end
