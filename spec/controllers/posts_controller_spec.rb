require 'spec_helper'

describe PostsController do
	context 'GET #index' do
		xit 'should return all of the posts' do
			get :index
			expect(assigns(:posts)).to eq Post.all
		end
	end
end