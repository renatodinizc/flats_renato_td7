class AddStatusToPropertyReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :property_reservations, :status, :integer, default: 1
  end
end
