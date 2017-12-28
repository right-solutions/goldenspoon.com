# This migration comes from dhatu (originally 20171203114529)
class AddMetaDescriptionToServices < ActiveRecord::Migration[5.1]
  def change
  	add_column :services, :meta_description, :string, null: true, limit: 512
  	remove_column :services, :one_liner
  	Dhatu::Service.update_all("meta_description = description")
  end
end
