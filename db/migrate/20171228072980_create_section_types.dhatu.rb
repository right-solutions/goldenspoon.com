# This migration comes from dhatu (originally 20171120145546)
class CreateSectionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :section_types do |t|
      t.string :name, :null => false, limit: 64
      t.string :code, :null => false, limit: 64
      t.timestamps null: false
    end
  end
end