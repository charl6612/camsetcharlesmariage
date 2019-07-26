class InvitesController < ApplicationController
  def index         # GET /restaurants
    @invite = Invite.all
  end

  def show          # GET /Invites/:id
    @invite = Invite.find(params[:id])
  end

  def new
    @invite = Invite.new
  end

  def create        # POST /Invites
    @invite = Invite.new(Invite_params)
    if @invite.save
      redirect_to Invite_path(@invite)
    else
      render :new
    end
  end

  def edit          # GET /articles/:id/edit
    @invite = Invite.find(params[:id])
  end

  def update
    @invite = Invite.find(params[:id])
    @invite.update(Invite_params)
    redirect_to Invite_path(@invite)
  end

  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy
    redirect_to Invites_path
  end


  private

  def Invite_params
    params.require(:Invite).permit(:first_name, :last_name, :email, :temoin, :allowedbefore, :user)
  end

end