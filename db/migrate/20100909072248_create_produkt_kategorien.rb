class CreateProduktKategorien < ActiveRecord::Migration
  def self.up
    create_table :produkt_kategorien do |t|
      t.string :name, :unique => true
      t.string :titel
      t.integer :sorter
      t.text :inhalt
      t.references :produkt_bereich
      t.string :icon_file_name
      t.string :icon_content_type
      t.integer :icon_file_size
      t.datetime :icon_updated_at

      t.timestamps
    end
    add_index :produkt_kategorien, :name
    add_index :produkt_kategorien, :produkt_bereich_id
  end

  def self.down
    drop_table :produkt_kategorien
  end
end
