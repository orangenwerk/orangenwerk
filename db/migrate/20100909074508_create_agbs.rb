class CreateAgbs < ActiveRecord::Migration
  def self.up
    create_table :agbs do |t|
      t.string :name
      t.string :titel
      t.string :headline
      t.text :inhalt
      t.string :paragraf, :unique => true

      t.timestamps
    end
    add_index :agbs, :paragraf
  end

  def self.down
    drop_table :agbs
  end
end
