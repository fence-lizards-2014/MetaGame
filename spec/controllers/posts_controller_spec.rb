require 'spec_helper'

describe PostsController do
	context 'GET #index' do
		it 'should return all of the posts' do
			get :index
			expect(assigns(:posts)).to eq Post.all
		end
	end
end