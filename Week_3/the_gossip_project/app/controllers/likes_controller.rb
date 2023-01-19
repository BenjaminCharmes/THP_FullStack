class LikesController < ApplicationController
  before_action :authenticate_user
  
  def index
  end

  def new 
    @like = Like.new(
      likeable_id: params[:likeable_id],
      likeable_type: params[:likeable_type],
      user: current_user
    )
    @gossip = Gossip.find(@like.likeable_id)
    @like.save
    redirect_to @gossip
  end

  def create
  end

  def destroy
    @like = Like.find(params[:id])
    @gossip = Gossip.find(@like.likeable_id)
    @like.destroy
    redirect_to @gossip
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end