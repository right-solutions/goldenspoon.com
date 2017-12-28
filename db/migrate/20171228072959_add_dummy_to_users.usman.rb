# This migration comes from usman (originally 20170929083233)
class AddDummyToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :dummy, :boolean, default: false
  end
end
