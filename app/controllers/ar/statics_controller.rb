class Ar::StaticsController < ApplicationController

  # GET /home
  def home
    @destinations = Destination.all
    @trips = Trip.all
    @contact = Contact.new

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
