class UserRegistriesController < ApplicationController
  def new
    @registry = Registry.find(params[:registry_id])
    @users = User.all
  end

  def create
    registry = Registry.find(params[:registry_id])
    user = User.find_by(email: params[:email])
    registry.user_registries.create(user: user)
    redirect_to registry_path(registry)
  end

  def destroy
    registry = Registry.find(params[:registry_id])
    user = User.find(params[:user_id])
    user_registry = UserRegistry.find_by(user: user, registry: registry)
    user.user_registries.delete(user_registry)
    redirect_to registry_path(registry)
  end 

end