class CreateKunden < ActiveRecord::Migration
  def self.up
    create_table :kunden do |t|
      t.string :name, :unique => true
      t.string :titel
      t.text :inhalt
      t.datetime :datum
      t.references :branche
      t.references :produkt_bereich
      t.string :icon_file_name
      t.string :icon_content_type
      t.integer :icon_file_size
      t.datetime :icon_updated_at

      t.timestamps
    end
    add_index :kunden, :name
  end

  def self.down
    drop_table :kunden
  end
end
