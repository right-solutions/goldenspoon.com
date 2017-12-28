# This migration comes from usman (originally 20170825020624)
class AddOtpVerifiedAtToDevices < ActiveRecord::Migration[5.1]
  def change
    add_column :devices, :otp_verified_at, :datetime
  end
end
