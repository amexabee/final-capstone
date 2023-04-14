class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.references :swim_class, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
