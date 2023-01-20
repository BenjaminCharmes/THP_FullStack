class AttendanceController < ApplicationController

  def index
    if params[:event]
      @event = Event.find(params[:event])
    else
      @event = Event.find(params[:format])
    end

    @attendances = Attendance.where(event_id: @event.id)
  end

  def new
    @event = Event.find(params[:event])

    Attendance.new(user_id: current_user.id, event_id: @event.id)
  end

  def create
  end



end
