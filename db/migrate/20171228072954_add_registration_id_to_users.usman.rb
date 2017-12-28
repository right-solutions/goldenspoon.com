# This migration comes from usman (originally 20170819113218)
class AddRegistrationIdToUsers < ActiveRecord::Migration[5.0]
  def change
    def change
      add_reference :users, :registration, foreign_key: true
    end
  end
end
