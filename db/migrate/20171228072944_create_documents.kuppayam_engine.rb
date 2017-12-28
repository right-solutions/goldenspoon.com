# This migration comes from kuppayam_engine (originally 20170000000001)
class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string  :document
      t.string  :document_type
      t.integer :documentable_id
      t.string  :documentable_type
      t.timestamps
    end

    add_index(:documents, :document_type)
    add_index(:documents, [ :documentable_id, :documentable_type ])
  end
end