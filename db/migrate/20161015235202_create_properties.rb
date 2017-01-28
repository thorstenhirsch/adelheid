class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string  :name
      t.integer :application_id
      t.boolean :show
      t.integer :number
      t.string  :xpath

      t.timestamps
    end

    # PK
    add_index :properties, [ :application_id, :name ], length: { name: 30 }, unique: true
  end
end
