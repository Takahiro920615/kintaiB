class UsersController < ApplicationController
  before_action :set_user, only:  %i(new create edit)
  
  def new
    
  end
  
  def create
    
  end
  
  def edit
      @user = User.find(params[:id])
  
  end
  
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end

end
