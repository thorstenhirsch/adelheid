class CreateArtefacts < ActiveRecord::Migration[5.0]
  def change
    create_table :artefacts do |t|
      t.string :name
      t.integer :artefact_type_id
      t.integer :artefact_version_id
      t.integer :application_id
      t.text :description

      t.timestamps
    end

    add_index :artefacts, :name, length: { name: 30 }
    add_index :artefacts, :application_id
    # PK
    add_index :artefacts, [ :application_id, :name ], length: { name: 30 }, unique: true
  end
end
