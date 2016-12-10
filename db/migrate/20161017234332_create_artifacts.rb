class CreateArtifacts < ActiveRecord::Migration[5.0]
  def change
    create_table :artifacts do |t|
      t.string :name
      t.integer :artifact_type_id
      t.integer :artifact_version_id
      t.integer :application_id
      t.text :description

      t.timestamps
    end

    add_index :artifacts, :name, length: { name: 30 }
    add_index :artifacts, :application_id
    # PK
    add_index :artifacts, [ :application_id, :name ], length: { name: 30 }, unique: true
  end
end
