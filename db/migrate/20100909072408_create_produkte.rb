class CreateProdukte < ActiveRecord::Migration
  def self.up
    create_table :produkte do |t|
      t.string :name, :unique => true
      t.string :titel
      t.integer :sorter
      t.text :inhalt
      t.text :beschreibung
      t.references :produkt_kategorie
      t.string :icon_file_name
      t.string :icon_content_type
      t.integer :icon_file_size
      t.datetime :icon_updated_at
      t.string :produktbild_file_name
      t.string :produktbild_content_type
      t.integer :produktbild_file_size
      t.datetime :produktbild_updated_at

      t.timestamps
    end
    add_index :produkte, :name
    add_index :produkte, :produkt_kategorie_id
  end

  def self.down
    drop_table :produkte
  end
end
