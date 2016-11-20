class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.integer :user_id
      t.integer :application_id
      t.integer :environment_group_id
      t.integer :environment_id
      t.string :key
      t.string :value

      t.timestamps
    end

    add_index :permissions, :user_id
    add_index :permissions, [ :user_id, :application_id ]
    add_index :permissions, [ :user_id, :environment_group_id ]
    add_index :permissions, [ :user_id, :environment_id ]

    # PK
    add_index :permissions, [ :user_id, :key ], length: { key: 30 }
  end
end
