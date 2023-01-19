class CommentController < ApplicationController
  before_action :authenticate_user

  def create
    @comment = Comment.new(
      content: params[:content],
      gossip_id: params[:gossip_id],
      user_id: current_user.id
    )

    if @comment.save
      redirect_to Gossip.find(params[:gossip_id])
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(content: params[:content])
      redirect_to Gossip.find(params[:gossip_id])
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @gossip_id = @comment.gossip_id
    @comment.destroy
    redirect_to Gossip.find(@gossip_id)
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
