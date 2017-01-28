class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :name

      t.timestamps
    end

    # PK
    add_index :applications, :name, length: { name: 30 }, unique: true
  end
end
