class CreateProduktBereicheReferenzen < ActiveRecord::Migration
  def self.up
    create_table :produkt_bereiche_referenzen do |t|
      t.references :produkt_bereich
      t.references :referenz

      t.timestamps
    end
    add_index :produkt_bereiche_referenzen, :produkt_bereich_id
    add_index :produkt_bereiche_referenzen, :referenz_id
  end

  def self.down
    drop_table :produkt_bereiche_referenzen
  end
end
