class CreateUsersApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :users_applications do |t|
      t.string :user_id
      t.string :application_id
      t.text :environment_spec

      t.timestamps
    end

    add_index :users_applications, :user_id
    add_index :users_applications, [ :user_id, :application_id ], unique: true
  end
end
