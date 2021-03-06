class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :admin_user, only: :destroy

  def show
  	@user = User.find(params[:id])
    @micropost = @user.microposts.paginate(page: params[:page])
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
    if @user.present?
      @user.update_attributes(params[:user])
      @user.save
      redirect_to @user
      flash[:success] = "Profile updated"
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(:page => params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
    def signed_in_user
        redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end
end