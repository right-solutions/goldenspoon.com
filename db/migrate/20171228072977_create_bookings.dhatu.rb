# This migration comes from dhatu (originally 20171104163661)
class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :name, :null => false, limit: 256
      t.references :service, index: true

      t.string :email, null: true, limit: 256
      t.string :mobile, null: true, limit: 16

      t.date :date, :null => true
      t.string :time, null: true, limit: 16

      t.string :message, :limit=>1048

      t.boolean :featured, default: false
      t.string :status, :null => false, :default=>"new", :limit=>16
      t.timestamps null: false
    end

    add_index :bookings, :status
  end
end
