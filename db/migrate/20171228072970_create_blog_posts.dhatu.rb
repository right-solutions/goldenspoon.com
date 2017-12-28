# This migration comes from dhatu (originally 20171012103806)
class CreateBlogPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_posts do |t|
      
      t.string :title, null: false, limit: 256
      t.string :slug, null: true, limit: 64
      t.string :author, null: true, limit: 256
      t.string :meta_description, null: true, limit: 512

      t.text   :description
      
      t.datetime :posted_at, null: true
      
      t.boolean :featured, default: false
      t.string :status, null: false, :default=>"unpublished", limit: 16

      t.text :tags

      t.timestamps null: false
    end
    add_index :blog_posts, :status
  end
end
