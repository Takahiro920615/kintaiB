class UsersController < ApplicationController
  before_action :set_user, only:  %i(new create edit)
  
  def new
    @user = User.new(user_params)
  end
    

  
  def create
    @user = User.new(user_params)
    if @user.save
      
    else
      render.new
    end
    
  end
  
  def edit
      @user = User.find(params[:id])
  
  end
  
  def index
  end
  
  def show
  end
  
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

end
