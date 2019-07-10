class PresencesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @presence = Presence.new

  end

  def create
    @user = User.find(params[:user_id])
    @presence = Presence.new(presence_params)
    @presence.user = User.find(params[:user_id])
    @presence.user = current_user
    if @presence.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def presence_params
    params.require(:presence).permit(:nuit_jeudi, :nuit_vendredi, :nuit_samedi, :mariage)
  end
end
