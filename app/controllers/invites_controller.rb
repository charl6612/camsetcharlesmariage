class InvitesController < ApplicationController
  def index         # GET /restaurants
    @user = User.find(params[:user_id])
    @invite = Invite.all
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
    if @invite.save
      redirect_to root_path
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
    redirect_to root_path
  end

  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy
    redirect_to root_path
  end


  private

  def invite_params
    params.require(:invite).permit(:first_name, :last_name, :email, :temoin, :allowedbefore, :user)
  end

end