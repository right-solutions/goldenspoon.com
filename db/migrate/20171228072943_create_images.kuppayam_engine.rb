# This migration comes from kuppayam_engine (originally 20170000000000)
class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string  :image
      t.string  :image_type
      t.integer :imageable_id
      t.string  :imageable_type
      t.timestamps
    end

    add_index(:images, :image_type)
    add_index(:images, [ :imageable_id, :imageable_type ])
  end
end