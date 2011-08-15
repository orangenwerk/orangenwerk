class CreateBannersProduktKategorien < ActiveRecord::Migration
  def self.up
    create_table :banners_produkt_kategorien do |t|
      t.references :banner
      t.references :produkt_kategorie

      t.timestamps
    end
    add_index :banners_produkt_kategorien, :banner_id
    add_index :banners_produkt_kategorien, :produkt_kategorie_id
  end

  def self.down
    drop_table :banners_produkt_kategorien
  end
end
