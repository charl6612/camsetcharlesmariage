class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :voyage]

  def home
    @markers = {
      lat: 50.7563673,
      lng: 2.7835309
    }
    url = "http://res.cloudinary.com/dsp2exmo1/image/list/carousel.json"
    carousel_serialized = open(url).read
    @carousels = JSON.parse(carousel_serialized)["resources"]
  end

  def programme

  end

  def voyage
    @disable_nav = true
  end

end
