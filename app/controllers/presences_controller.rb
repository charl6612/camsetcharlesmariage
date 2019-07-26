class PresencesController < ApplicationController
  def new
    @invite = Invite.find(params[:invite_id])
    if @invite.presence
      edit
    else
      @presence = Presence.new
    end
  end

  def create
    @invite = Invite.find(params[:invite_id])
    @presence = Presence.new(presence_params)
    @presence.invite = Invite.find(params[:invite_id])
    @presence.invite = current_invite
    if @presence.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit # GET /articles/:id/edit
    @invite = Invite.find(params[:invite_id])
    @presence = @invite.presence
  end

  def update
    @presence = Presence.find(params[:id])
    @presence.update(presence_params)
    redirect_to root_path
  end

  def destroy
    @presence = Presence.find(params[:id])
    @presence.destroy
    redirect_to root_path
  end

  private

  def presence_params
    params.require(:presence).permit(:nuit_jeudi, :nuit_vendredi, :nuit_samedi, :mariage)
  end
end
