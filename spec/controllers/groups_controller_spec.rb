require 'spec_helper'


describe GroupsController do
  let(:user) { FactoryGirl.create :user }
  let(:valid_attributes) { { "group_name" => "MyString", "group_description" => "a description", "group_logo_url" => "www.google.com", "group_tagline" => "advanced" } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all groups as @groups" do
      group = Group.create! valid_attributes
      get :index, {}, valid_session
      assigns(:groups).should eq([group])
    end
  end

  describe "GET show" do
    it "assigns the requested group as @group" do
      group = Group.create! valid_attributes
      get :show, {:id => group.to_param}, valid_session
      assigns(:group).should eq(group)
    end
  end

  describe "GET new" do
    it "assigns a new group as @group" do
      get :new, {}, valid_session
      assigns(:group).should be_a_new(Group)
    end
  end

  describe "GET edit" do
    it "assigns the requested group as @group" do
      group = Group.create! valid_attributes
      get :edit, {:id => group.to_param}, valid_session
      assigns(:group).should eq(group)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Group" do
        session[:id] = user.id
        expect {
          post :create, group: valid_attributes, current_user: user
        }.to change{Group.count}.by(1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved group as @group" do
        Group.any_instance.stub(:save).and_return(false)
        post :create, {:group => { "group_name" => "invalid value" }}, valid_session
        assigns(:group).should be_a_new(Group)
      end

      it "re-renders the 'new' template" do
        Group.any_instance.stub(:save).and_return(false)
        post :create, {:group => { "group_name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested group" do
        group = Group.create! valid_attributes
        Group.any_instance.should_receive(:update_attributes).with({ "group_name" => "MyString" })
        put :update, {:id => group.to_param, :group => { "group_name" => "MyString" }}, valid_session
      end

      it "assigns the requested group as @group" do
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param, :group => valid_attributes}, valid_session
        assigns(:group).should eq(group)
      end

      it "redirects to the group" do
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param, :group => valid_attributes}, valid_session
        response.should redirect_to(group)
      end
    end

    describe "with invalid params" do
      it "assigns the group as @group" do
        group = Group.create! valid_attributes
        Group.any_instance.stub(:save).and_return(false)
        put :update, {:id => group.to_param, :group => { "group_name" => "invalid value" }}, valid_session
        assigns(:group).should eq(group)
      end

      it "re-renders the 'edit' template" do
        group = Group.create! valid_attributes
        Group.any_instance.stub(:save).and_return(false)
        put :update, {:id => group.to_param, :group => { "group_name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested group" do
      group = Group.create! valid_attributes
      expect {
        delete :destroy, {:id => group.to_param}, valid_session
      }.to change(Group, :count).by(-1)
    end

    it "redirects to the groups list" do
      group = Group.create! valid_attributes
      delete :destroy, {:id => group.to_param}, valid_session
      response.should redirect_to(groups_url)
    end
  end

end
