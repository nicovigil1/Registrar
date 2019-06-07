class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])
    session[:user_id] = user.id
    redirect_to user_path(user)
  end
end