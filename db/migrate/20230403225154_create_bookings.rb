class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
       t.datetime :date
       t.string :city

      t.timestamps
    end
  end
end
