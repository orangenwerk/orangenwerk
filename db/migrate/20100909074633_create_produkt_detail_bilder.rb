class CreateProduktDetailBilder < ActiveRecord::Migration
  def self.up
    create_table :produkt_detail_bilder do |t|
      t.string :name
      t.string :titel
      t.integer :sorter
      t.text :inhalt
      t.references :produkt
      t.string :icon_file_name
      t.string :icon_content_type
      t.integer :icon_file_size
      t.datetime :icon_updated_at

      t.timestamps
    end
    add_index :produkt_detail_bilder, :produkt_id
  end

  def self.down
    drop_table :produkt_detail_bilder
  end
end
