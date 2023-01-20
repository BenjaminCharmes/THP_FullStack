class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @events = Event.all
  end

  def new
  end

  def create
    event = params[:event]
    @new_event = Event.new(
      start_date: event[:start_date],
      duration: event[:duration].to_i,
      title: event[:title],
      description: event[:description],
      price: event[:price].to_i,
      location: event[:location],
      admin: current_user
    )

    if @new_event.save
      redirect_to @new_event
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    event = params[:event]
    if current_user.id == @event.admin_id
      if @event.update(
        start_date: event[:start_date],
        duration: event[:duration].to_i,
        title: event[:title],
        description: event[:description],
        price: event[:price].to_i,
        location: event[:location],
        )
        redirect_to attendance_index_path(@event)
      else
        render :edit
      end
    else
      redirect_to @event
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if current_user.id == @event.admin_id
      @event.destroy
      redirect_to root_path
    else
      redirect_to @event
    end
  end

end
