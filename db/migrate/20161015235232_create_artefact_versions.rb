class CreateArtefactVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :artefact_versions do |t|
      t.integer :artefact_id
      t.string :version
      t.integer :version_number

      t.timestamps
    end

    add_index :artefact_versions, :artefact_id
    # PK
    add_index :artefact_versions, [ :artefact_id, :version_number ], unique: true
  end
end
