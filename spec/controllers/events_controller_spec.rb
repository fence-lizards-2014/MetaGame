require 'spec_helper'

describe EventsController do
   let!(:user) { FactoryGirl.create :user }
  # CR use attributes_for and valid / invalid factories
  let(:valid_attributes) { { "event_name" => "MyString", "event_game_title" => "example", "event_description" => "a description", "event_zipcode" => 12345, "event_date" => "3/3/2050", "event_location" => "San Francisco" } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all events as @events" do
      event = Event.create! valid_attributes
      # CR use a factory
      get :index, {}, valid_session
      assigns(:events).should eq([event])
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      event = Event.create! valid_attributes
      get :show, {:id => event.to_param}, valid_session
      assigns(:event).should eq(event)
    end
  end

  describe "GET new" do
    it "assigns a new event as @event" do
      get :new, {}, valid_session
      assigns(:event).should be_a_new(Event)
    end
  end

  describe "GET edit" do
    it "assigns the requested event as @event" do
      event = Event.create! valid_attributes
      get :edit, {:id => event.to_param}, valid_session
      assigns(:event).should eq(event)
    end
  end

    context 'POST create' do
      it "creates a new Event" do
      session[:id] = user.id
        expect{
          post :create, event: valid_attributes, current_user: user
        }.to change{Event.count}.by(1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved event as @event" do
        Event.any_instance.stub(:save).and_return(false)
        post :create, {:event => { "event_name" => "invalid value" }}, valid_session
        assigns(:event).should be_a_new(Event)
      end

      it "re-renders the 'new' template" do
        Event.any_instance.stub(:save).and_return(false)
        post :create, {:event => { "event_name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end


  describe "PUT update" do
    describe "with valid params" do
      it "assigns the requested event as @event" do
        event = Event.create! valid_attributes
        put :update, {:id => event.to_param, :event => valid_attributes}, valid_session
        assigns(:event).should eq(event)
      end

      it "redirects to the event" do
        event = Event.create! valid_attributes
        put :update, {:id => event.to_param, :event => valid_attributes}, valid_session
        response.should redirect_to(event)
      end
    end

    describe "with invalid params" do
      it "assigns the event as @event" do
        event = Event.create! valid_attributes
        Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => event.to_param, :event => { "event_name" => "invalid value" }}, valid_session
        assigns(:event).should eq(event)
      end

      it "re-renders the 'edit' template" do
        event = Event.create! valid_attributes
        Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => event.to_param, :event => { "event_name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested event" do
      event = Event.create! valid_attributes
      expect {
        delete :destroy, {:id => event.to_param}, valid_session
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list" do
      event = Event.create! valid_attributes
      delete :destroy, {:id => event.to_param}, valid_session
      response.should redirect_to(events_url)
    end
  end

end
