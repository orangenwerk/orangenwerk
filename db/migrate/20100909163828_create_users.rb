class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :unique => true
      t.string :email, :unique => true
      t.string :encrypted_password
      t.string :salt
      t.boolean :admin, :default => false
      t.boolean :strangemaster, :default => false
      t.boolean :autor, :default => false

      t.timestamps
    end
    add_index :users, :name
    add_index :users, :email
  end

  def self.down
    drop_table :users
  end
end
