class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :about
      t.time :start_time
      t.time :end_time
      t.string :location_name
      t.string :address
      t.float :price
      t.string :ticket_url
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
