class UsersController < ApplicationController

  def new
    @user = User.new
    @user_count = User.where(claimed: false).count

    if params[:code] 
      @code = params[:code]
      @name_user=User.find_by code:@code
      @name_user.name
    end
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

  def count_users_in_q
    User.where(claimed: false).count
  end


private 
 def add_token
   User.generate_token
 end




end