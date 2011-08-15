class CreateBranchen < ActiveRecord::Migration
  def self.up
    create_table :branchen do |t|
      t.string :name, :unique => true
      t.string :titel
      t.text :inhalt
      t.integer :sorter

      t.timestamps
    end
    add_index :branchen, :name
  end

  def self.down
    drop_table :branchen
  end
end
