# This migration comes from usman (originally 20170819113219)
class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|

      t.references :user, index: true
      t.references :registration, index: true
      
      t.string :uuid, limit: 1024
      t.string :device_token, limit: 1024

      # Apple iPhone, Samsung Note
      t.string :device_name, limit: 64

      # iPhone 7 Plus, Note 6
      t.string :device_type, limit: 64

      # Jelly Beans / Lollypop
      t.string :operating_system, limit: 64

      # iOS version / Android version
      t.string :software_version, limit: 64
      
      # Know what was the last API accessed and when
      # This is to catch the users who are inactive
      t.datetime :last_accessed_at
      t.string :last_accessed_api, limit: 1024

      # One Time Password
      t.integer :otp
      t.datetime :otp_sent_at

      # API token
      t.string :api_token, limit: 256
      t.datetime :token_created_at, default: nil
      
      t.string :status, :null => false, :default=>"pending", :limit=>16
      
      t.timestamps
    end
  end
end
