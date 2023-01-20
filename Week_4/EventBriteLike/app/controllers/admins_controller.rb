class AdminsController < ApplicationController
  before_action :authorize_admin, only: :index
  def index
    @users = User.all
    @events = Event.all
  end
end