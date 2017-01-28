class CreateEnvironments < ActiveRecord::Migration[5.0]
  def change
    create_table :environments do |t|
      t.string :name
      t.integer :environment_group_id
      t.integer :number
      t.string :color

      t.timestamps
    end

    # PK
    add_index :environments, [ :name, :environment_group_id ], length: { name: 30 }, unique: true
    # number is for sorting in the gui, but not part of the PK
    # access (when environment_group is turned off)
    add_index :environments, :name, length: { name: 30 }
  end
end
