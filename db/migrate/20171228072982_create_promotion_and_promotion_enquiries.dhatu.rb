# This migration comes from dhatu (originally 20171120145548)
 class CreatePromotionAndPromotionEnquiries < ActiveRecord::Migration[5.1]
  def change
  	create_table :promotions do |t|
      
      t.string :title, :null => false, limit: 256
      t.string :short_description, :null => true, limit: 512
      t.string :code, :null => true, limit: 64

      t.boolean :display_name, default: true, null: false
      t.boolean :display_email, default: true, null: false
      t.boolean :display_phone, default: true, null: false

      t.boolean :name_mandatory, default: true, null: false
      t.boolean :email_mandatory, default: false, null: false
      t.boolean :phone_mandatory, default: false, null: false

      t.boolean :featured, default: false
      t.string :status, :null => false, :default=>"unpublished", :limit=>16
      t.integer :priority, default: 1, null: false

      t.timestamps null: false
    end

    create_table :promotion_attributes do |t|
    	
    	t.string :name, :null => false, limit: 64
    	# Data Type could be text, integer, date, list_drop_down (Select from a List), list_radio_button (Choose one) & boolean (Checkbox)
    	t.string :data_type, :null => false, default: :text, limit: 24
    	# This column is applicable for list_drop_down and list_radio_button data types
    	
    	t.text :values
    	
    	t.boolean :mandatory, :null => false, default: false
    	t.boolean :display, :null => false, default: false

    	t.string :status, :null => false, :default=>"unpublished", :limit=>16
      t.integer :priority, default: 1, null: false

      t.references :promotion, index: true
      
      t.timestamps null: false
    end

    create_table :promotion_enquiries do |t|
      
      t.string :name, :null => false, limit: 256
      t.string :email, :null => true, limit: 256
      t.string :phone, :null => true, limit: 24

      t.references :promotion, index: true
      t.string :status, :null => false, :default=>"unpublished", :limit=>16

      # Additional Details
      t.text :additional_attributes

      t.timestamps null: false
    end
  end
end