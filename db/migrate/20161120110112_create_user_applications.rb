class CreateUserApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :user_applications do |t|
      t.string :user_id
      t.string :application_id
      t.text :environment_spec

      t.timestamps
    end

    add_index :user_applications, :user_id
    add_index :user_applications, [ :user_id, :application_id ], unique: true
  end
end
