# This migration comes from dhatu (originally 20171012073510)
class CreateTestimonials < ActiveRecord::Migration[5.0]
  def self.up
    create_table :testimonials do |t|
      t.string :name, :null => false, :limit=>256
      t.string :designation, :null => true, :limit=>256
      t.string :organisation, :null => true, :limit=>256
      t.string :status, :null => false, :limit=>64
      t.boolean :featured, default: false
      t.text :statement
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :testimonials
  end
end