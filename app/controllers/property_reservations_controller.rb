class PropertyReservationsController < ApplicationController
  #before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def show
      @property_reservation = PropertyReservation.find(params[:id])
  end

  def create
      @property_reservation = current_user.property_reservations.new(params.require(:property_reservation).
                                                                    permit(:start_date, :end_date, :guests))
      #@property_reservation.user = current_user
      @property_reservation.property = Property.find(params[:property_id])
      @property_reservation.save!

      redirect_to @property_reservation, notice: 'Pedido de reserva confirmado! (via flash)'
  end

  def accept
    @property_reservation = PropertyReservation.find(params[:id])
    @property_reservation.accepted!
    redirect_to @property_reservation.property
  end
end