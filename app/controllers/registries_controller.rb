class RegistriesController < ApplicationController
  def show
    @registry = Registry.find(params[:id])
    @participants = @registry.participants.select("participants.*, participant_registries.created_at AS enrolled_at")
    @users = @registry.users
  end
  

end