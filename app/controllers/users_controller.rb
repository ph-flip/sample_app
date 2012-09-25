class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
    	flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      sign_in @user
    else
      render 'new'
    end
  end

  def edit
    if params[:id].present?
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def update 
    @user = User.find(params[:id])
    if params[:id].present?
     @user.update_attributes(params[:user])
      @user.save
      redirect_to @user
      flash[:success] = "Profile updated"
    else
      render 'edit'
    end
  end
end