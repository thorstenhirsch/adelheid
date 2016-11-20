class CreateArtefactFilters < ActiveRecord::Migration[5.0]
  def change
    create_table :artefact_filters do |t|
      t.integer :application_id
      t.string :key
      t.string :value

      t.timestamps
    end

    add_index :artefact_filters, :key, length: { key: 30 }
  end
end
