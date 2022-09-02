class UsersController < ApplicationController
  befpr_action :set_user, only:  %i(new create edit)
  
  def new
    
  end
  
  def create
    
  end
  
  def edit
    if @user.save
      redirect_to user      
    else
      
    end
  end
  
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end

end
