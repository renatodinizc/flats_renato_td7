class PropertyReservation < ApplicationRecord
  belongs_to :property
  belongs_to :user

  before_save :calculate_total_value

  private

  def calculate_total_value
    self.total_value = (self.end_date - self.start_date).to_i * property.daily_rate * self.guests
  end

end
