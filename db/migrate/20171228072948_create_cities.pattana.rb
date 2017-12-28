# This migration comes from pattana (originally 20170000000005)
class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table(:cities) do |t|

      t.string :name, limit: 128
      t.string :alternative_names, null: true, limit: 256
      t.string :iso_code, limit: 128
      
      t.references :country, index: true
      t.references :region, index: true

      # Lattitude and Longitude
      t.decimal :latitude, {:precision=>10, :scale=>6}
      t.decimal :longitude, {:precision=>10, :scale=>6}

      t.integer :population, null: true

      t.integer :priority, default: 1000
      t.boolean :show_in_api, default: false

      t.timestamps
    end

    add_index :cities, :iso_code
    
  end
end
