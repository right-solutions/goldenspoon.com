# This migration comes from dhatu (originally 20171012103805)
class CreateTeamMembers < ActiveRecord::Migration[5.0]
  def self.up
    create_table :team_members do |t|
      t.string :name
      t.string :designation
      t.string :status
      t.boolean :featured
      t.text :description
      t.string :linked_in_url
      t.string :google_plus_url
      t.string :facebook_url
      t.string :twitter_url
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :team_members
  end
end