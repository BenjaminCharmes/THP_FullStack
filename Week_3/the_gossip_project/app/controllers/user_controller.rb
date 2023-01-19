class UserController < ApplicationController
  before_action :authenticate_user, only: [:edit, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def new
    if @user
      @user = User.find(params[:id])
    end
    @cities = City.all
  end

  def create
    if @user
      @user = User.find(params[:id])
    end
    @cities = City.all

    unless City.find_by(name: params[:city]).name
      City.create(name: params[:city], zip_code: Faker::Address.zip_code)
    end

    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      age: params[:age],
      city_id: City.find_by(name: params[:city]).id,
      description: params[:description]
    )
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @cities = City.all
  end

  def update
    @user = User.find(params[:id])
    @cities = City.all
    if current_user.id == @user.id
      if @user.update(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        password: params[:password],
        age: params[:age],
        city_id: params[:city].to_i,
        description: params[:description]
      )
        redirect_to @user
      else
        render :edit
      end
    else
      redirect_to @user
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.id == @user.id
      @user.destroy
      redirect_to root_path
    else
      redirect_to @user
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