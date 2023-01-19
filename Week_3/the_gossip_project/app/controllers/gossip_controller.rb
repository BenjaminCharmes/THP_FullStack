class GossipController < ApplicationController

  before_action :authenticate_user, only: [:new, :create, :update, :destroy]

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @author = Gossip.find(params[:id]).user
  end

  def new
    @tags = Tag.all
  end

  def create
    @gossip = Gossip.new(
      title: params[:title],
      content: params[:content],
      user_id: current_user.id
    )

    if @gossip.save
      JoinTableGossipTag.create(gossip_id: @gossip.id, tag_id: params[:tag].to_i)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
    @tags = Tag.all
    @tag = Tag.find(JoinTableGossipTag.find_by(gossip_id: @gossip.id).tag_id)
  end

  def update
    @gossip = Gossip.find(params[:id])
    
    if current_user.id == @gossip.user_id
      if @gossip.update(title: params[:title], content: params[:content])
        @tag_to_update = JoinTableGossipTag.find_by(gossip_id: @gossip.id)
        @tag_to_update.update(tag_id: params[:tag].to_i)
        redirect_to @gossip
      else
        render :edit
      end
    else
      redirect_to @gossip
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if current_user.id == @gossip.user_id
      @gossip.destroy
      redirect_to root_path
    else
      redirect_to @gossip
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end