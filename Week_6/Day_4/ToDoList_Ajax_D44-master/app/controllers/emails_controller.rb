class EmailsController < ApplicationController
  def index;
   @emails = Email.all.order('created_at DESC')
  end

  def show
    @email = Email.find(params[:id])
    @email.update(read: true)
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def create
    @email = Email.create(object: Faker::Beer.name, body: Faker::TvShows::TheFreshPrinceOfBelAir.quote)
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js {}
    end
  end

  def update
    @email = Email.find(params[:id])
    @email.update(emails_params)
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js {}
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js {}
    end
  end

  private

  def emails_params
    params.permit(:object, :body, :read)
  end
end
