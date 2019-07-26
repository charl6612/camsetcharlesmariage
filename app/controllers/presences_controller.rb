class PresencesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    if @invite.presence
      edit
    else
      @presence = Presence.new
    end
  end

  def create
    @presence = Presence.new(presence_params)
    @presence.invite = Invite.find(params[:presence][:invite])
    if @presence.save
      redirect_to root_path()
    else
      render :new
    end
  end

  def edit          # GET /articles/:id/edit
    @presence = Presence.find(params[:id])
    @invite = @presence.invite
    @user = current_user
  end

  def update
    @presence = Presence.find(params[:id])
    @invite = @presence.invite
    @user = current_user

    @presence.update(presence_params)
    redirect_to root_path()
  end

  def destroy
    @presence = Presence.find(params[:id])
    @presence.destroy
    redirect_to root_path()
  end

  private

  def presence_params
    params.require(:presence).permit(:nuit_jeudi, :nuit_vendredi, :nuit_samedi, :mariage)
  end
end
