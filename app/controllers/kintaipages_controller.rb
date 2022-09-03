class KintaipagesController < ApplicationController
  def top
  end
  
  def edit
    @user = User.find(params[:id])
  end
end
