class RegistriesController < ApplicationController
  def show
    @registry = Registry.find(params[:id])
    @users = @registry.users
  end
  

end