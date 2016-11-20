class CreateSourceVcsRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :source_vcs_repositories do |t|
      t.integer :server_id
      t.string :name
      t.string :shortname

      t.timestamps
    end

    add_index :source_vcs_repositories, :name, length: { name: 100 }
  end
end
