# This migration comes from usman (originally 20170929083236)
class AddCountryCityToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :country_id, :integer
  	add_column :users, :city_id, :integer
  	Registration.in_batches.each do |relation|
		  relation.all.each do |reg|
		  	user = reg.user
		  	user.country_id = reg.country_id
		  	user.city_id = reg.city_id
		  	user.save
		  end
		end
  end
end
