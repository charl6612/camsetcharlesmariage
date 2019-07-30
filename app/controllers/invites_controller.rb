class InvitesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @invites = @user.invites
  end

  def show          # GET /Invites/:id
    @invite = Invite.find(params[:id])
  end

  def new
    @invite = Invite.new
    @user = User.find(params[:user_id])
  end

  def create        # POST /Invites
    @user = User.find(params[:user_id])
    @invite = Invite.new(invite_params)
    @invite.user = current_user
    binding.pry
    if @invite.save
      redirect_to new_user_invite_presence_path(@user, @invite)
    else
      render :new
    end
  end

  def edit          # GET /articles/:id/edit
    @user = User.find(params[:user_id])
    @invite = Invite.find(params[:id])
  end

  def update
    @invite = Invite.find(params[:id])
    @invite.update(Invite_params)
    @user = User.find(params[:user_id])
    redirect_to user_invites_path(@user)
  end

  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy
    redirect_to user_invites_path(current_user)
  end

  private

  def invite_params
    params.require(:invite).permit(:first_name, :last_name, :email, :temoin, :allowedbefore, :user, :child)
  end
end
