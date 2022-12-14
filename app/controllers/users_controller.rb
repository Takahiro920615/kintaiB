class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :destroy, :edit_basic_info, :update_basic_info]
  before_action :logged_in_user, only:[ :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :correct_user, only: [:show,:edit, :update]
  before_action :admin_user, only: [:destroy, :edit_basic_info, :update_basic_info]
  before_action :set_one_month, only: :show
  
  
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
   
    @worked_sum = @attendances.where.not(started_at:nil).count
   
  end
  
  
  
  def index
    @user = User.find_by(name: params[:name])
    @users = User.paginate(page: params[:page], per_page: 20).search(params[:search])
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
    if @user.update_attributes(basic_info_params)
      @user.save
      flash[:success]= "#{@user.name}の基本情報を更新しました。"
      redirect_to users_url
      
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました。" + @user.errors.full_messages.join("、")
      redirect_to users_url
    end
    
  end
 
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  
  
  
  
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger]="ログインしてください"
      redirect_to login_url
    end
  end
  
  def correct_user
    redirect_to (root_url) unless current_user?(@user)
  end
  
  def basic_info_params
    params.require(:user).permit(:department,:basic_time,:work_time)
  end
  
  def admin_user
    redirect_to root_url unless current_user.admin?
  end


end
