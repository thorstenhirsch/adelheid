class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      # names
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :email

      t.timestamps

      # also check the additions from devise in its own migration
    end

    # PK
    add_index :users, :username, length: { username: 30 }, unique: true
    # user can also login with email - as long as it is unique
    add_index :users, :email, length: { email: 50 }
  end
end
