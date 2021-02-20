class BookTripsController < ApplicationController
  before_action :set_book_trip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:book_trip, :index, :show]
  before_action :set_trip, :authenticate_user!, only: [:book_trip_en, :book_trip_ar]

  
  # GET /book_trips
  # GET /book_trips.json
  def index
    @book_trips = BookTrip.all
  end

  # GET /book_trips/1
  # GET /book_trips/1.json
  def show
  end

  # GET /book_trips/new
  def new
    @book_trip = BookTrip.new
  end

  # GET /book_trips/1/edit
  def edit
  end

  # POST /book_trips
  # POST /book_trips.json
  def create
    @book_trip = BookTrip.new(book_trip_params)

    respond_to do |format|
      if @book_trip.save
        format.html { redirect_to @book_trip, notice: 'Book trip was successfully created.' }
        format.json { render :show, status: :created, location: @book_trip }
      else
        format.html { render :new }
        format.json { render json: @book_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /**/trip/:id
  # POST /**/trip/:id
  def book_trip_en
    @book_trip = BookTrip.new(book_trip_params)

    @book_trip.total_price = (book_trip_params[:adults].to_i*@trip.adult_price) + (book_trip_params[:children].to_i*@trip.child_price)
    if (@book_trip.total_price < 1 || !@trip.is_available)
      return redirect_to request.referer, alert: "Invalid Booking"
    end

    @book_trip.user_id = @current_user.id
    
    respond_to do |format|
      if @book_trip.save
        format.html { redirect_to request.referer, notice: 'Book trip was successfully created.' }
        format.json { render :show, status: :created, location: @book_trip }
      else
        format.html { render 'en/trips/show' }
        format.json { render json: @book_trip.errors, status: :unprocessable_entity }
      end
    end
  end


    # POST /**/trip/:id
  # POST /**/trip/:id
  def book_trip_ar
    @book_trip = BookTrip.new(book_trip_params)

    @book_trip.total_price = (book_trip_params[:adults].to_i*@trip.adult_price) + (book_trip_params[:children].to_i*@trip.child_price)
    if (@book_trip.total_price < 1 || !@trip.is_available)
      return redirect_to request.referer, alert: "حجز محظور"
    end

    @book_trip.user_id = @current_user.id
    
    respond_to do |format|
      if @book_trip.save
        format.html { redirect_to request.referer, notice: 'لقد نجحت في حجز الرحلة' }
        format.json { render :show, status: :created, location: @book_trip }
      else
        format.html { render 'ar/trips/show' }
        format.json { render json: @book_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def cancel_trip_en
    @current_user.book_trips.where(history: false).destroy_all
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Checkout successfully' }
      format.json { head :no_content }
    end
  end

  def cancel_trip_ar
    @current_user.book_trips.where(history: false).destroy_all
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'لقد نجحت في إلغاء الرحلة' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_trip
      @book_trip = BookTrip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_trip_params
      params.require(:book_trip).permit(:adults, :children, :total_price, :is_paid, :trip_id, :user_id)
    end

    def set_trip
      @trip = Trip.find(book_trip_params[:trip_id]) unless book_trip_params[:trip_id].nil?
      return redirect_to request.referer  if @trip.nil?
    end
end
