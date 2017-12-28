# This migration comes from usman (originally 20170929083235)
class ChangeDisabledToRemovedFeatures < ActiveRecord::Migration[5.1]
  def change
  	Feature.where("status = 'disabled'").update_all(status: 'removed')
  end
end
