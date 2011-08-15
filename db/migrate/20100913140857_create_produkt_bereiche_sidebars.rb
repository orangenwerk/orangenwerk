class CreateProduktBereicheSidebars < ActiveRecord::Migration
  def self.up
    create_table :produkt_bereiche_sidebars do |t|
      t.references :produkt_bereich
      t.references :sidebar

      t.timestamps
    end
    add_index :produkt_bereiche_sidebars, :produkt_bereich_id
    add_index :produkt_bereiche_sidebars, :sidebar_id
  end

  def self.down
    drop_table :produkt_bereiche_sidebars
  end
end
