class Admins::EventsController < ApplicationController
  require_relative '../../helpers/admins_helper'
  require_relative '../../helpers/events_helper'
  before_action :require_admin

  def index
    @events = Event.all
  end

  def show
    @event = find_event
  end

  def edit
    @event = find_event
  end

  def destroy
    find_event.destroy
    redirect_to admins_path
  end

  def update
    find_event.update(validated: params[:event].fetch('validated'))
    redirect_to admins_path
  end

  private

  def event_params
    params.require(:event).require(:validated).permit(:validated)
  end
end