class CreateArtifactVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :artifact_versions do |t|
      t.integer :artifact_id
      t.string :version
      t.integer :version_number

      t.timestamps
    end

    add_index :artifact_versions, :artifact_id
    # PK
    add_index :artifact_versions, [ :artifact_id, :version_number ], unique: true
  end
end
