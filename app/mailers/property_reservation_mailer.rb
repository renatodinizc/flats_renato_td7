class PropertyReservationMailer < ApplicationMailer

  def notify_new_reservation
    @reservation = params[:reservation]
    # O método mail é equivalente ao render ou o redirect_to dos controllers
    mail(to: @reservation.property.property_owner.email,
          subject: 'Nova reserva para seu imóvel')
  end
end