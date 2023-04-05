class AddSwimClassToBooking < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :swim_class, null: false, foreign_key: true
  end
end
