class CreateSwimClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :swim_classes do |t|
      t.string :name
      t.text :description
      t.string :location
      t.decimal :price
      t.string :image
      t.boolean :booked

      t.timestamps
    end
  end
end
