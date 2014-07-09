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

	context 'POST #create' do
		xit 'should increase the database count by 1 if valid params' do
			expect {
				post :create, post: { page_content: "hello" }
			}.to change { Post.count }.by(1)
		end
	end

end