# This migration comes from dhatu (originally 20171010055102)
class CreateSections < ActiveRecord::Migration[5.0]
  def self.up
    create_table :sections do |t|
      t.string :title, :null => false, :limit=>256
      t.string :sub_title, :null => false, :limit=>256
      t.string :short_description, :limit=>1048
      t.text :long_description
      t.string :button_one_text, :limit=>64
      t.string :button_two_text, :limit=>64
      t.string :button_one_link, :limit=>512
      t.string :button_two_link, :limit=>512
      t.string :section_type, :limit=>64
      t.string :status, :null => false, :default=>"unpublished", :limit=>16
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :sections
  end
end