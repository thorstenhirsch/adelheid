class CreateDeployments < ActiveRecord::Migration[5.0]
  def change
    create_table :deployments do |t|
      t.timestamp :timestamp
      t.integer :artifact_id
      t.integer :artifact_version_id
      t.integer :environment_id
      t.text :notes

      t.timestamps
    end

    add_index :deployments, :artifact_id
    add_index :deployments, :environment_id
    add_index :deployments, [ :artifact_id, :environment_id ]
    add_index :deployments, [ :artifact_id, :artifact_version_id ]
    add_index :deployments, [ :artifact_id, :artifact_version_id, :environment_id ], name: "index_deployments_on_artifact_artifactversion_environment", unique: true
  end
end
