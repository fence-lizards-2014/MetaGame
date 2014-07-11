require 'spec_helper'
require 'bcrypt'


describe UsersController do

  let(:valid_attributes) { { "username" => "MyString", "password_hash" => "Ex123@123kdk", "confirm_pw" => "Ex123@123kdk", "user_email" => "example@gmail.com", "user_zipcode" => 12345 } }
  let(:valid_session) { {} }

  let!(:current_user){ User.create("username" => "dominate", "password_hash" => "Sdndk23@4(", "user_email" => "exe@gmail.com", "user_zipcode" => 54321) }  
  let!(:user) { FactoryGirl.create :user }
  

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      assigns(:user).should be_a_new(User)
    end
  end

  describe "GET new password" do
    it "assigns @user to the current_user" do
      session[:id] = 1
      get :new_password
      assigns(:user).should eq(User.find(session[:id]))
    end

    it "renders the new password template" do
      get :new_password
      expect(response).to render_template("users/_changepw")
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      get :edit, {:id => user.to_param}, valid_session
      assigns(:user).should eq(user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect{
          post :create, user: valid_attributes
        }.to change{User.count}.by(1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        User.any_instance.stub(:save).and_return(false)
        post :create, {:user => { "username" => "invalid value" }}, valid_session
        assigns(:user).should be_a_new(User)
      end

      it "re-renders the 'new' template" do
        User.any_instance.stub(:save).and_return(false)
        post :create, {:user => { "username" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        User.any_instance.should_receive(:update_attributes).with({ "username" => "MyString" })
        put :update, {:id => user.to_param, :user => { "username" => "MyString" }}, valid_session
      end

      it "assigns the requested user as @user" do
        put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        assigns(:user).should eq(user)
      end

      it "redirects to the user" do
        put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        response.should redirect_to(user)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => user.to_param, :user => { "username" => "invalid value" }}, valid_session
        assigns(:user).should eq(user)
      end

      it "re-renders the 'edit' template" do
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => user.to_param, :user => { "username" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      expect {
        delete :destroy, {:id => user.to_param}, valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete :destroy, {:id => user.to_param}, valid_session
      response.should redirect_to(users_url)
    end
  end

end
