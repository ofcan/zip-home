class EventsController < ApplicationController

  before_filter :assert_admin, :only => [:new, :create]
  
  layout 'two_column'
  
  def index
    @upcoming_events = Event.where('beginning > ?', Time.now).order('beginning asc').all
    @past_events = Event.where('beginning < ?', Time.now).order('beginning asc').all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
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

end
