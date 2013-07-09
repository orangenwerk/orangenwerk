class CreateReferenzen < ActiveRecord::Migration
  def self.up
    create_table :referenzen do |t|
      t.string :name
      t.string :titel
      t.text :inhalt
      t.string :objekt
      t.string :ort
      t.boolean :webref, :default => false
      t.references :banche
      t.references :produkt_bereich
      t.references :produkt_kategorie
      t.references :produkt
      t.string :icon_file_name
      t.string :icon_content_type
      t.integer :icon_file_size
      t.datetime :icon_updated_at

      t.timestamps
    end
    add_index :referenzen, :banche_id
    add_index :referenzen, :produkt_bereich_id
    add_index :referenzen, :produkt_kategorie_id
    add_index :referenzen, :produkt_id
  end

  def self.down
    drop_table :referenzen
  end
end
