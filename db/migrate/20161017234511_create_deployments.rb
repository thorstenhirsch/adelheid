class CreateDeployments < ActiveRecord::Migration[5.0]
  def change
    create_table :deployments do |t|
      t.timestamp :timestamp
      t.integer :artefact_id
      t.integer :artefact_version_id
      t.integer :environment_id
      t.text :notes

      t.timestamps
    end

    add_index :deployments, :artefact_id
    add_index :deployments, :environment_id
    add_index :deployments, [ :artefact_id, :environment_id ]
    add_index :deployments, [ :artefact_id, :artefact_version_id ]
    add_index :deployments, [ :artefact_id, :artefact_version_id, :environment_id ], name: "index_deployments_on_artefact_artefactversion_environment", unique: true
  end
end
