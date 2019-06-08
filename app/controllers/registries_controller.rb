class RegistriesController < ApplicationController
  def show
    @registry = Registry.find(params[:id])
    @users = @registry.users
  end
  
  def update
    if params[:toggle]
      registry = Registry.find(params[:id])
      registry.toggle(:open).save
      redirect_to registry_path(registry)
    end
  end

end