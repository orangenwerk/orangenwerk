class CreateProduktKategorienReferenzen < ActiveRecord::Migration
  def self.up
    create_table :produkt_kategorien_referenzen do |t|
      t.references :produkt_kategorie
      t.references :referenz

      t.timestamps
    end
    add_index :produkt_kategorien_referenzen, :produkt_kategorie_id
    add_index :produkt_kategorien_referenzen, :referenz_id
  end

  def self.down
    drop_table :produkt_kategorien_referenzen
  end
end
