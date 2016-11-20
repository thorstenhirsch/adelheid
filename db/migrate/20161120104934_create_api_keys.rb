class CreateApiKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_keys do |t|
      t.integer :user_id
      t.string :name
      t.boolean :active
      t.string :key

      t.timestamps
    end

    add_index :api_keys, :user_id
    add_index :api_keys, :key, length: { key: 32 }, unique: true
  end
end
