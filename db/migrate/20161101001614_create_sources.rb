class CreateSources < ActiveRecord::Migration[5.0]
  def change
    create_table :sources do |t|
      t.string :type
      t.integer :artefact_id

      t.timestamps
    end
  end
end
