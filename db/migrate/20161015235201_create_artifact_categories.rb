class CreateArtifactCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :artifact_categories do |t|
      t.string :name

      t.timestamps
    end

    # PK
    add_index :artifact_categories, :name, length: { name: 30 }, unique: true
  end
end
