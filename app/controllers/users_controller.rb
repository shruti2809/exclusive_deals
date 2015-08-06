class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.generate_token
    if @user.save
      UserMailer.code_confirmation(@user).deliver
      render 'new'
    else
      render 'new'
    end
  end
  
  def user_params
    params.require(:user).permit(:name,:email)
  end

private 
 def add_token
   User.generate_token
 end
end