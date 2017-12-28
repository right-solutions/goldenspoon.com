# This migration comes from dhatu (originally 20171104163659)
class AddPriorityToTables < ActiveRecord::Migration[5.1]
  def change
  	add_column :events, :priority, :integer, default: 1000
  	add_column :offers, :priority, :integer, default: 1000
  	add_column :testimonials, :priority, :integer, default: 1000
  	add_column :team_members, :priority, :integer, default: 1000
  end
end
