class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @markers = {
        lat: 50.7563673,
        lng: 2.7835309,
      }
  end
end
