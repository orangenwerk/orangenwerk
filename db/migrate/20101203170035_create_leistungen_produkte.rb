class CreateLeistungenProdukte < ActiveRecord::Migration
  def self.up
    create_table :leistungen_produkte, :force => true do |t|
      t.references :leistung
      t.references :produkt

      t.timestamps
    end
    add_index :leistungen_produkte, :leistung_id
    add_index :leistungen_produkte, :produkt_id
  end

  def self.down
    drop_table :leistungen_produkte
  end
end
