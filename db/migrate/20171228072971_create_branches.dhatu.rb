# This migration comes from dhatu (originally 20171014125053)
class CreateBranches < ActiveRecord::Migration[5.0]
  def self.up
    create_table :branches do |t|
      
      t.string :title, null: false, limit: 256

      t.string :address_1, null: true, limit: 256
      t.string :address_2, null: true, limit: 256
      t.string :address_3, null: true, limit: 256

      t.string :email, null: true, limit: 256
      t.string :landline, null: true, limit: 16
      t.string :fax, null: true, limit: 16
      t.string :mobile, null: true, limit: 16

      t.string :facebook, null: true, limit: 256
      t.string :twitter, null: true, limit: 256
      t.string :google_plus, null: true, limit: 256
      t.string :linked_in, null: true, limit: 256
      t.string :youtube, null: true, limit: 256
      t.string :instagram, null: true, limit: 256
      t.string :tumblr, null: true, limit: 256
      t.string :pinterest, null: true, limit: 256
      t.string :blog, null: true, limit: 256

      t.string :status, null: false, limit: 16
      t.boolean :featured, default: false
      t.boolean :main_branch, default: false
      
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :branches
  end
end