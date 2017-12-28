# This migration comes from dhatu (originally 20160803045832)
class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      
      t.string :title, :null => false, :limit=>256
      t.string :offer_text, :null => false, :limit=>64

      t.text   :description
      
      t.datetime :starts_at, :null => true
      t.datetime :ends_at, :null => true
      
      t.boolean :featured, default: false
      t.string :status, :null => false, :default=>"unpublished", :limit=>16

      t.timestamps null: false
    end
    add_index :offers, :status
  end
end
