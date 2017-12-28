# This migration comes from usman (originally 20170905041104)
class AddGenderToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :gender, :string, default: :nogender
    add_column :users, :date_of_birth, :date
  end
end
