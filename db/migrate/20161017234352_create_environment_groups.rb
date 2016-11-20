class CreateEnvironmentGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :environment_groups do |t|
      t.string :name
      t.integer :number
      t.string :color

      t.timestamps
    end
    # PK
    add_index :environment_groups, :name, length: { name: 30 }, unique: true
    # number is for sorting in the gui
  end
end
