class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @room = Room.find(configure_reservation_create_params[:room_id])
    @reservation = Reservation.new(configure_reservation_create_params)
    @reservation.user_id = current_user.id
    if @reservation.valid?

    else
      flash[:alert] = @reservation.errors[:alert][0];
      redirect_to @room
    end
  end

  def create
    @reservation = Reservation.new(configure_reservation_create_params)
    @reservation.user_id = current_user.id
    @reservation.save
    flash[:notice] = "Reservation was successfully created."
    flash[:notice_green] = "Reservation was successfully created."
    redirect_to @reservation
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private

  def configure_reservation_create_params
    params.require(:reservation).permit(:room_id, :start_date, :end_date, :peoples)
  end
end
