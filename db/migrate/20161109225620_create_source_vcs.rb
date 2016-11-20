class CreateSourceVcs < ActiveRecord::Migration[5.0]
  def change
    create_table :source_vcs do |t|
      t.integer :repository_id
      t.string :branch
      t.string :tag
      t.string :revision

      t.timestamps
    end
  end
end
