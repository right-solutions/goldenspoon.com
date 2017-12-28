# This migration comes from dhatu (originally 20171014125054)
class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, :null => false, limit: 128
      t.string :category_type, :null => false, limit: 64
      t.string :one_liner
      t.string :permalink, :null => false, limit: 128
      t.text   :description
      t.references :parent, references: :category
      t.references :top_parent, references: :category
      
      t.string :status, :null => false, :default=>"unpublished", :limit=>16
      t.boolean :featured, default: false
      t.boolean :end_node, default: true
      t.integer :priority, default: 1, null: false

      t.timestamps null: false
    end

    add_index :categories, :permalink, :unique => true
    add_index :categories, :status
  end
end
