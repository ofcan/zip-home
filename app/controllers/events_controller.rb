class EventsController < ApplicationController

  before_filter :find_event, :only => [:show, :edit, :update, :destroy]
  before_filter :assert_admin, :only => [:new, :create, :edit, :update, :destroy]
  
  layout 'two_column'
  
  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
    @today_events = Event.today
  end

  def show
    @comments = @event.comments.order("created_at asc")
    @commentable = @event
    @comment = @commentable.comments.build
  end

  def new
    @event = Event.new
    @title = 'New event'
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to @event, :notice => 'Event created.'
    else
      render :new
      flash.now[:alert] = 'Event not created.'
    end
  end

  def edit
    @title = 'Edit event'
  end

  def update
    if @event.update_attributes(params[:event])
      redirect_to @event, notice: 'Event updated.'
    else
      render :edit
      flash.now[:alert] = 'Event not updated.'
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Event destroyed.'
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

end
