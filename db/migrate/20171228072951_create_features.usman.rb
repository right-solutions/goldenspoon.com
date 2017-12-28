# This migration comes from usman (originally 20170000000101)
class CreateFeatures < ActiveRecord::Migration[5.0]
  
  def change
    create_table(:features) do |t|
      t.string :name
      t.string :status, :null => false, :default=>"unpublished", :limit=>16
      t.timestamps
    end

    create_table :permissions do |t|
      t.belongs_to :user, index: true
      t.belongs_to :feature, index: true
      t.boolean :can_create, default: false
      t.boolean :can_read, default: true
      t.boolean :can_update, default: false
      t.boolean :can_delete, default: false
      
      t.timestamps
    end

    add_index(:permissions, [ :user_id, :feature_id ], :unique => true)
  end

end
