# This migration comes from dhatu (originally 20171120145545)
class RemoveCategoriesFromSection < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :sections, :category, index: true
  end
end
