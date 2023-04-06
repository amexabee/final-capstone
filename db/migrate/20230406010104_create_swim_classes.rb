class CreateSwimClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :swim_classes do |t|
      t.string   :name
      t.string   :description
      t.string  :location
      t.string   :image
      t.decimal  :fee
      t.boolean  :booked, null: false, default: false

      t.timestamps
    end
  end
end
