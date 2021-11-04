require 'rails_helper'

RSpec.describe PropertyReservationMailer, type: :mailer do
  context 'on new reservation' do
    it 'should notify property owner' do
      foo = PropertyOwner.create!(email: 'foobar@foo.com', password: '123123')
      jane = User.create!(email: 'jane@doe.com', password: '123456')
      property_type = PropertyType.create!(name: 'Apartamento')
      property_region = PropertyRegion.create!(name: 'Praia')
      property = Property.create!(title: 'Apartamento novo', description: 'Um apartamento legal',
                  rooms: 3, bathrooms: 2, pet_friendly: true, parking_spot: false, daily_rate: 100,
                  property_type: property_type, property_region: property_region, property_owner: foo)
      reservation = PropertyReservation.create!(start_date: 4.weeks.from_now, end_date: 10.weeks.from_now,
                  guests: 6, property: property, user: jane)
          
      mail = PropertyReservationMailer.with(reservation: reservation).notify_new_reservation()

      expect(mail.to).to eq ['foobar@foo.com']
      expect(mail.from).to eq ['nao-responda@flats.com']
      expect(mail.subject).to eq 'Nova reserva para seu imóvel'
      expect(mail.body).to include "Seu imóvel 'Apartamento novo' foi reservado por jane@doe.com"
    end
  end
end