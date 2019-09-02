class PresencesController < ApplicationController
  def index         # GET /restaurants
    @invite =  Invite.find(params[:id])
    @user =  User.find(params[:id])
    @presences = Presence.all
  end

  def show          # GET /Presences/:id
    @invite =  Invite.find(params[:invite_id])
    @user =  User.find(params[:user_id])
    @presence = @invite.presence
  end

  def new
    @invite =  Invite.find(params[:invite_id])
    @user =  User.find(params[:user_id])
    @presence = Presence.new
    @presence.nuit_samedi = false
    @presence.mariage = false
  end

  def create        # POST /Presences
    @presence = Presence.new(presence_params)
    @invite =  Invite.find(params[:invite_id])
    @user =  User.find(params[:user_id])
    @presence.invite = @invite
    if @presence.save
      redirect_to user_invites_path(current_user)
    else
      render :new
    end
  end

  def edit          # GET /articles/:id/edit
    @invite =  Invite.find(params[:invite_id])
    @user =  User.find(params[:user_id])
    @presence = Presence.find(params[:id])
  end

  def update
    @invite =  Invite.find(params[:invite_id])
    @user =  User.find(params[:user_id])
    @presence = Presence.find(params[:id])
    @presence.update(presence_params)
    redirect_to user_invites_path(current_user)
  end

  def destroy
    @presence = Presence.find(params[:id])
    @presence.destroy
    redirect_to user_invites_path(current_user)
  end

  private

  def presence_params
    params.require(:presence).permit(:nuit_jeudi, :nuit_vendredi, :nuit_samedi, :mariage)
  end
end
