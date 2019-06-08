class UsersController < ApplicationController
  def show
    @user_registries = current_user.registries
  end

  def new
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :phone)
  end
end