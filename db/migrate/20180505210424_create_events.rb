class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :about
      t.datetime :start_time
      t.datetime :end_time
      t.string :location_name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.float :price
      t.string :ticket_url

      t.timestamps
    end
  end
end
