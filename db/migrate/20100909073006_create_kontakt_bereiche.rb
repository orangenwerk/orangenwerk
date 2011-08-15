class CreateKontaktBereiche < ActiveRecord::Migration
  def self.up
    create_table :kontakt_bereiche do |t|
      t.string :name, :unique => true
      t.string :titel
      t.integer :sorter
      t.text :inhalt

      t.timestamps
    end
    add_index :kontakt_bereiche, :name
  end

  def self.down
    drop_table :kontakt_bereiche
  end
end
