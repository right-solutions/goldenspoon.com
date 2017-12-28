# This migration comes from kuppayam_engine (originally 20170000000002)
class CreateImportData < ActiveRecord::Migration[5.0]
  def change
    create_table :import_data do |t|
    	t.integer :importable_id
      t.string  :importable_type
      t.string  :data_type # CSV, XLSX, XLS
      t.string :status, :null => false, :default=>"pending", :limit=>16
      t.timestamps
    end
    add_index(:import_data, [ :importable_id, :importable_type ])
    add_index(:import_data, :data_type )
    add_index(:import_data, :status )
  end
end