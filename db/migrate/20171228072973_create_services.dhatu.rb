# This migration comes from dhatu (originally 20171014125055)
class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :name, :null => false, limit: 128
      t.string :one_liner
      t.string :permalink, :null => false, limit: 128
      t.text   :description

      t.text :price
      t.text :duration
      
      t.references :category
      
      t.string :status, :null => false, :default=>"unpublished", :limit=>16
      t.boolean :featured, default: false
      t.integer :priority, default: 1, null: false

      t.timestamps null: false
    end

    add_index :services, :permalink, :unique => true
    add_index :services, :status
  end
end
