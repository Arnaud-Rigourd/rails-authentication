class OffersController < ApplicationController
  def index
    @offers = policy_scope(Offer)
  end

  def new
    @offer = Offer.new
    @booking = Booking.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @booking = Booking.new(booking_params)
    @offer.user = current_user
    authorize @offer
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
    @bookings = @offer.bookings
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :user_id)
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
