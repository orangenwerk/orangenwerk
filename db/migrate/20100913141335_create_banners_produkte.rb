class CreateBannersProdukte < ActiveRecord::Migration
  def self.up
    create_table :banners_produkte do |t|
      t.references :banner
      t.references :produkt

      t.timestamps
    end
    add_index :banners_produkte, :banner_id
    add_index :banners_produkte, :produkt_id
  end

  def self.down
    drop_table :banners_produkte
  end
end
