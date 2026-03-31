class ReservationsController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
  end
  
  def create
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.room_id = params[:reservation][:room_id]
  
    if @reservation.save
      redirect_to reservations_path
    else
      @room = Room.find(params[:reservation][:room_id])
      render :new
    end
  end
  
  def index
    @reservations = current_user.reservations.includes(:room)
  end
  
  private
  
  def reservation_params
    params.require(:reservation).permit(:check_in_date, :check_out_date, :people_count)
  end

end
