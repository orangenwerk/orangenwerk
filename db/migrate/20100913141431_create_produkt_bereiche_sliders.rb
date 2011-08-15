class CreateProduktBereicheSliders < ActiveRecord::Migration
  def self.up
    create_table :produkt_bereiche_sliders do |t|
      t.references :produkt_bereich
      t.references :slider

      t.timestamps
    end
    add_index :produkt_bereiche_sliders, :produkt_bereich_id
    add_index :produkt_bereiche_sliders, :slider_id
  end

  def self.down
    drop_table :produkt_bereiche_sliders
  end
end
