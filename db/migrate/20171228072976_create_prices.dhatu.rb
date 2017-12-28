# This migration comes from dhatu (originally 20171104163660)
class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.string :title, :null => false, limit: 128
      t.string :sub_title
      t.text :price
      t.references :category, index: true
      t.string :status, :null => false, :default=>"unpublished", :limit=>16
      t.boolean :featured, default: false
      t.integer :priority, default: 1, null: false

      t.timestamps null: false
    end

    add_index :prices, :status
  end
end
