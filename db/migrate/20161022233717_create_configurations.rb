class CreateConfigurations < ActiveRecord::Migration[5.0]
  def change
    create_table :configurations do |t|
      t.integer :user_id
      t.string :key
      t.string :value

      t.timestamps
    end

    add_index :configurations, :user_id
    # PK
    add_index :configurations, [ :user_id, :key ], length: { key: 30 }, unique: true
  end
end
