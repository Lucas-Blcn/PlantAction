class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking_params, only: %i[edit destroy]

  def new
    @booking = Booking.new
    @plant = Plant.find(params[:plant_id])
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user_id = current_user.id
    @plant = Plant.find(params[:plant_id])
    @booking.plant_id = @plant.id
    if @booking.save!
      redirect_to my_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    if @booking.destroy
      redirect_to my_bookings_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_booking_params
    @booking = Booking.find(params[:id])
  end

  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end
end
