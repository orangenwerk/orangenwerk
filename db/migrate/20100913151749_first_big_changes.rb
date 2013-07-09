class FirstBigChanges < ActiveRecord::Migration
  def self.up
    remove_column :agbs, :titel
    remove_column :branchen, :inhalt
    remove_column :faqs, :titel
    remove_column :kunden, :inhalt
    remove_column :kunden, :produkt_bereich_id
    remove_column :kunden_meinungen, :titel
    remove_column :produkt_detail_bilder, :titel
    remove_column :produkt_detail_bilder, :inhalt
    remove_column :referenz_bilder, :titel
    remove_column :referenzen, :titel
    remove_column :referenzen, :produkt_bereich_id
    remove_column :referenzen, :produkt_kategorie_id
    remove_column :referenzen, :produkt_id
  end

  def self.down
  end
end
