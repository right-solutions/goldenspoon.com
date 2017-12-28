# This migration comes from dhatu (originally 20171104163658)
class AddCategoryIdToBlogPosts < ActiveRecord::Migration[5.1]
  def change
  	add_reference :blog_posts, :category, index: true
  end
end
