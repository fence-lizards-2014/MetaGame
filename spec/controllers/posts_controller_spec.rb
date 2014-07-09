require 'spec_helper'

describe PostsController do

	let!(:user) { FactoryGirl.create :user }
	let!(:group) { FactoryGirl.create :group }
	let!(:post) { FactoryGirl.create :post }

	before(:each) do
		group.posts << post
		user.groups << group
	end

	context 'GET #index' do
		it 'should return all of the posts' do
			get :index
			expect(assigns(:posts)).to eq Post.all
		end


	end	

end