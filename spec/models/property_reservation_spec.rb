require 'rails_helper'

describe PropertyReservation do
  include ActiveSupport::Testing::TimeHelpers
  context 'Check  if' do
    it 'end date attribute is greater than start date attribute' do
      property_type = PropertyType.create!(name: 'Apartamento')
      property_region = PropertyRegion.create!(name: 'Praia')
      property_owner = PropertyOwner.create!(email: 'foobar@foo.com', password: '123123')
      property = Property.create!(title: 'Apartamento novo', description: 'Um apartamento legal',
                  rooms: 3, bathrooms: 2, pet_friendly: true, parking_spot: false, daily_rate: 100,
                  property_type: property_type, property_region: property_region, property_owner: property_owner)
      user = User.create!(email: 'foobar@foo.com', password: '123123')
      
      reservation = PropertyReservation.new(start_date: 5.days.from_now, end_date: 2.days.from_now,
                                             guests: 2, property: property, user: user)


      expect(reservation.valid?).to eq false

    end

    it 'end date attribute canoot be equal to start date attribute' do
      property_type = PropertyType.create!(name: 'Apartamento')
      property_region = PropertyRegion.create!(name: 'Praia')
      property_owner = PropertyOwner.create!(email: 'foobar@foo.com', password: '123123')
      property = Property.create!(title: 'Apartamento novo', description: 'Um apartamento legal',
                  rooms: 3, bathrooms: 2, pet_friendly: true, parking_spot: false, daily_rate: 100,
                  property_type: property_type, property_region: property_region, property_owner: property_owner)
      user = User.create!(email: 'foobar@foo.com', password: '123123')

      reservation = PropertyReservation.new(start_date: 2.days.from_now, end_date: 2.days.from_now,
        guests: 2, property: property, user: user)

      expect(reservation.valid?).to eq false

    end

    it 'starting date cannot be prior than today' do
      property_type = PropertyType.create!(name: 'Apartamento')
      property_region = PropertyRegion.create!(name: 'Praia')
      property_owner = PropertyOwner.create!(email: 'foobar@foo.com', password: '123123')
      property = Property.create!(title: 'Apartamento novo', description: 'Um apartamento legal',
                                  rooms: 3, bathrooms: 2, pet_friendly: true, parking_spot: false, daily_rate: 100,
                                  property_type: property_type, property_region: property_region, property_owner: property_owner)
      user = User.create!(email: 'foobar@foo.com', password: '123123')

      reservation = PropertyReservation.new(guests: 2, property: property, user: user)

      travel_to 1.month.ago do
        reservation.start_date = Date.today
        reservation.end_date = 1.day.from_now
      end

      expect(reservation.valid?).to eq false
    end
  end
end