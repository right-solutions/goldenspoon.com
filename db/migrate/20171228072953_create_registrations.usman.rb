# This migration comes from usman (originally 20170819113217)
class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|

      t.references :user, index: true
      t.references :country, index: true
      t.references :city, index: true
      
      t.string :dialing_prefix
      t.string :mobile_number
      
      t.string :status, :null => false, :default=>"pending", :limit=>16
      
      t.timestamps
    end
  end
end
