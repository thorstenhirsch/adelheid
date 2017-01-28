class CreateDeployments < ActiveRecord::Migration[5.0]
  def change
    create_table :deployments do |t|
      t.timestamp :timestamp
      t.integer :application_id
      t.integer :artifact_id
      t.integer :artifact_version_id
      t.integer :environment_id
      t.text :notes

      t.timestamps
    end

    add_index :deployments, :application_id
    add_index :deployments, :artifact_id
    add_index :deployments, :environment_id
    add_index :deployments, [ :application_id, :environment_id ]
    add_index :deployments, [ :artifact_id, :environment_id ]
    add_index :deployments, [ :artifact_id, :artifact_version_id ]
    # the following index is not unique, because we want to be able to rollback a deployment and re-deploy it (same version)
    add_index :deployments, [ :artifact_id, :artifact_version_id, :environment_id ], name: "index_deployments_on_artifact_artifactversion_environment"
  end
end
