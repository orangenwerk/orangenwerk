class CreateProduktBereiche < ActiveRecord::Migration
  def self.up
    create_table :produkt_bereiche do |t|
      t.string :name, :unique => true
      t.string :titel
      t.integer :sorter
      t.text :inhalt
      t.string :icon_file_name
      t.string :icon_content_type
      t.integer :icon_file_size
      t.datetime :icon_updated_at

      t.timestamps
    end
    add_index :produkt_bereiche, :name
  end

  def self.down
    drop_table :produkt_bereiche
  end
end
