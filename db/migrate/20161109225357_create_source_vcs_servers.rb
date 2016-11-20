class CreateSourceVcsServers < ActiveRecord::Migration[5.0]
  def change
    create_table :source_vcs_servers do |t|
      t.string :name
      t.string :url
      t.string :user
      t.string :password
      t.integer :vcs

      t.timestamps
    end
  end
end
