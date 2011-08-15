class CreateProdukteReferenzen < ActiveRecord::Migration
  def self.up
    create_table :produkte_referenzen do |t|
      t.references :produkt
      t.references :referenz

      t.timestamps
    end
    add_index :produkte_referenzen, :produkt_id
    add_index :produkte_referenzen, :referenz_id
  end

  def self.down
    drop_table :produkte_referenzen
  end
end
