# This migration comes from pattana (originally 20170000000003)
class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table(:countries) do |t|

      t.string :name, limit: 128
      t.string :official_name, limit: 128
      t.string :iso_name, limit: 128
      
      # Federal Information Processing Standard
      t.string :fips, limit: 56

      t.string :iso_alpha_2, limit: 5
      t.string :iso_alpha_3, limit: 5

      # Codes assigned by the International Telecommunications Union
      t.string :itu_code, limit: 5
      
      # International Dialing Prefix
      t.string :dialing_prefix, limit: 56 

      # Top Level Domain
      t.string :tld, limit: 16

      # Lattitude and Longitude
      t.decimal :latitude, {:precision=>10, :scale=>6}
      t.decimal :longitude, {:precision=>10, :scale=>6}

      # Other Details
      t.string :capital, limit: 64 
      t.string :continent, limit: 64 
      t.string :currency_code, limit: 16 
      t.string :currency_name, limit: 64 
      t.string :is_independent, limit: 56
      t.string :languages, limit: 256

      t.integer :priority, default: 1000

      t.boolean :show_in_api, default: false

      t.timestamps
    end
    
    add_index :countries, :fips
    add_index :countries, :iso_alpha_2
    add_index :countries, :iso_alpha_3
  end
end
