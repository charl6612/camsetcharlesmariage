class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def send_welcome_mail #envoyer un mail à tout le monde avec ses identifiant et mdp
  end
end
