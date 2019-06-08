class ParticipantsController < ApplicationController
  def show
  end

  def new 
    @registry = Registry.find(params[:registry_id])
    @participant = @registry.participants.build
  end

  def create
    #FIXME - refactor later 
    if params[:registry_id]
      @registry = Registry.find(params[:registry_id])
      @participant = @registry.participants.create(participant_params)
    end
    if params[:registry_id] && @participant.save
      redirect_to registry_path(@registry)
    else
      flash[:errors] = @participant.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    if registry = Registry.find(params[:registry_id])
      Participant.destroy(params[:id])
      redirect_to registry_path(registry)
    end
  end

  private

  def participant_params
    user_info = {user_id: current_user.id}
    params.require(:participant).permit(:name, :gender, :birthday, :contact_method, :email, :phone, :notes).merge(user_info)
  end

end