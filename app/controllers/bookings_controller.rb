class BookingsController < ApplicationController
  def index
    bookings = Booking.all
    render json: bookings, status: :ok
  end

  def show
    booking = Booking.find(params[:id])
    render json: booking, status: :ok
  end

  def create
    booking = Booking.new(booking_params)

    if booking.save
      render json: booking, status: :created
    else
      render json: { errors: booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :swim_class_id, :start_time, :end_time)
  end
end
