# This migration comes from usman (originally 20171124071245)
class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|

      t.string :name, limit: 512
    	
      t.string :account_type, null: true, limit: 256

      t.string :email, :null => true, limit: 256
      t.string :address, :null => true, limit: 512

      t.references :owner, references: :user
      t.references :done_deal_user, references: :user
      t.references :registration
      t.references :device
      
      t.string :contact_number_1, :null => false, :limit=>24
      t.string :contact_number_2, :null => true, :limit=>24
      t.string :contact_number_3, :null => true, :limit=>24
      t.string :contact_number_4, :null => true, :limit=>24

    end
  end
end
