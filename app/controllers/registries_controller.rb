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

  def new
    @registry = Registry.new
  end

  def create
    registry = Registry.new(registry_params)
    
    if registry.save
      UserRegistry.create(registry: registry, user: current_user)
      redirect_to user_path(current_user)
    else
      flash[:errors] = registry.errors.full_messages.to_sentence
      render :new
    end
  end

  private 

  def registry_params
    params.require(:registry).permit(:name, :location)
  end 

end