class UserController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]
  before_action :verify_identity, only: [:show, :edit]

  def show
    @user = User.find(params[:id])
    @events = Event.all.where(admin_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    user = params[:user]
    if current_user.id == @user.id
      if @user.update(
        first_name: user[:first_name],
        last_name: user[:last_name],
        description: user[:description]
        )
        redirect_to @user
      else
        render :edit
      end
    else
      redirect_to @user
    end
  end

  private

  def verify_identity
    unless current_user == User.find(params[:id])
      redirect_to root_path
    end
  end

end
