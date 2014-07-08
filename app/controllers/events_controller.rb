class EventsController < ApplicationController
 
  def index
    @events = Event.all
  end

  def show
    @event = Event.find params[:id]
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new params[:event]
    @group = Group.find session[:group_id] if session[:group_id]

    if @event.save
      Event.assign_assoc_to_event @event, @group, current_user

      flash[:notice] = 'Event has successfully been created!'
      redirect_to event_path @event
    else
      flash[:error] = 'Something went wrong!'
      render 'events/new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find params[:id]

    if @event.update_attributes params[:event]
      flash[:notice] = 'Event has successfully been updated!'
      redirect_to event_path @event
    else
      flash[:error] = 'Something went wrong!'
      render 'events/edit'
    end
  end

  def search
    #refactor for multiple event
    @event = Event.find(:all, :conditions => ['event_name LIKE ?', "%#{params['search']}%"]).first
    redirect_to events_path if @game == nil 
    if session[:group_id]
      @group = Group.find(session[:group_id])
      @group.events << @event
      redirect_to group_path(session[:group_id])
    else
      @user = User.find session[:id]
      @user.events << @event if @user
      redirect_to root_path
    end
  end

  def add_user_event
    @user = User.find session[:id]
    @event = Event.find params[:id]
    @event.users << @user
    @user.events << @event
    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end
end
