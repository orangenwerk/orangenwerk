class CreateKundenProduktBereiche < ActiveRecord::Migration
  def self.up
    create_table :kunden_produkt_bereiche, :force => true do |t|
      t.references :kunde
      t.references :produkt_bereich

      t.timestamps
    end
    add_index :kunden_produkt_bereiche, :kunde_id
    add_index :kunden_produkt_bereiche, :produkt_bereich_id
  end

  def self.down
    drop_table :kunden_produkt_bereiche
  end
end
