class CreateLeistungenProduktBereiche < ActiveRecord::Migration
  def self.up
    create_table :leistungen_produkt_bereiche do |t|
      t.references :leistung
      t.references :produkt_bereich

      t.timestamps
    end
    add_index :leistungen_produkt_bereiche, :leistung_id
    add_index :leistungen_produkt_bereiche, :produkt_bereich_id
  end

  def self.down
    drop_table :leistungen_produkt_bereiche
  end
end
