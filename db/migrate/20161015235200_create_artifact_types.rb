class CreateArtifactTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :artifact_types do |t|
      t.string :name
      t.integer :application_id

      t.timestamps
    end

    add_index :artifact_types, :name, length: { name: 30 }
    # PK
    add_index :artifact_types, [ :application_id, :name ], length: { name: 30 }, unique: true
  end
end
