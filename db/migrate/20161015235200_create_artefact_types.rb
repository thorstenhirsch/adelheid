class CreateArtefactTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :artefact_types do |t|
      t.string :name
      t.integer :application_id

      t.timestamps
    end

    add_index :artefact_types, :name, length: { name: 30 }
    # PK
    add_index :artefact_types, [ :application_id, :name ], length: { name: 30 }, unique: true
  end
end
