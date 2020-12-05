class En::StaticsController < ApplicationController

  # GET /home
  def home
    @destinations = Destination.all
    @trips = Trip.all
    @contact = Contact.new
    @posts = Post.limit(2)
  end

  # GET /images
  def images
    @destinations = Destination.all
    @trips = Trip.all
  end

  # GET /about
  def about
    @destinations = Destination.all
  end

end
