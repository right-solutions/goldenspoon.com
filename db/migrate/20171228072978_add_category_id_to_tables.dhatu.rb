# This migration comes from dhatu (originally 20171104163662)
class AddCategoryIdToTables < ActiveRecord::Migration[5.1]
  def change
  	add_reference :events, :category, index: true
  	add_reference :offers, :category, index: true
  	add_reference :sections, :category, index: true
  end
end
