class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  
  
  def new
    @user = User.new
  end
    

  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "新規作成に成功しました"
      redirect_to @user
    else
      render :new
    end
  end
  
  def edit
      @user = User.find(params[:id])
  end
  
 
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  def edit_basic_info
      
  end
  
  def update_basic_info
  end
 
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  
  def set_user
    @user= User.find(params[:id])
  end

end
