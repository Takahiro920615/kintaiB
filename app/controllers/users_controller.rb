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
    @users = User.paginate(page: params[:page])
  end
  
  def update
    @user = User.find(params[:id])
    if @user. update_attributes(user_params)
      flash[:success]= "更新しました。"
      redirect_to @user
    else
      render:edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}を削除しました。"
    redirect_to users_url
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
