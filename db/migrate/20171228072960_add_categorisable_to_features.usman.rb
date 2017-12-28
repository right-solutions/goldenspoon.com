# This migration comes from usman (originally 20170929083234)
class AddCategorisableToFeatures < ActiveRecord::Migration[5.1]
  def change
  	add_column :features, :categorisable, :boolean, default: false
  end
end
