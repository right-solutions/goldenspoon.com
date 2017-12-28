# This migration comes from dhatu (originally 20171203114530)
class AddControlFieldsToPromotions < ActiveRecord::Migration[5.1]
  def change
  	add_column :promotions, :show_popup, :boolean, default: true, :null => false
  	add_column :promotions, :show_only_on_homepage, :boolean, default: true, :null => false
  	add_column :promotions, :popup_lifespan_in_minutes, :integer, default: 60, :null => false
  end
end
