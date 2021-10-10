class PropertyReservation < ApplicationRecord
  belongs_to :property
  belongs_to :user

  validates :start_date, :end_date, :guests, presence: true
  validate  :end_date_greater_than_start_date
  validate :start_date_in_the_future
  #validar que o mesmo imóvel não pode ter duas reservas no mesmo momento

  before_save :calculate_total_value

  enum status: {pending: 1, accepted: 5, rejected: 10}

  private

  def calculate_total_value
    self.total_value = (self.end_date - self.start_date).to_i * property.daily_rate * self.guests
  end

  def end_date_greater_than_start_date
    if self.start_date >= self.end_date
      errors.add(:end_date, 'deve ser maior que a data de início')
    end
  end

  def start_date_in_the_future
    if start_date < Date.today
      errors.add(:start_date, 'não pode ser em datas passadas')
    end
  end

end
