class AddColumnStatusToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :status, :text
  end
end
