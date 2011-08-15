class CreateBannersProduktBereiche < ActiveRecord::Migration
  def self.up
    create_table :banners_produkt_bereiche, :force => true do |t|
      t.references :banner
      t.references :produkt_bereich

      t.timestamps
    end
    add_index :banners_produkt_bereiche, :banner_id
    add_index :banners_produkt_bereiche, :produkt_bereich_id
  end

  def self.down
    drop_table :banners_produkt_bereiche
  end
end
