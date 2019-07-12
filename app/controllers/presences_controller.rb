class PresencesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    if @user.presence
      edit
    else
      @presence = Presence.new
    end
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

  def edit # GET /articles/:id/edit
    @user = User.find(params[:user_id])
    @presence = @user.presence
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
