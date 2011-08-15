class CreateReferenzBilder < ActiveRecord::Migration
  def self.up
    create_table :referenz_bilder do |t|
      t.string :name
      t.string :titel
      t.text :inhalt
      t.integer :sorter
      t.references :referenz
      t.string :bild_file_name
      t.string :bild_content_type
      t.integer :bild_file_size
      t.datetime :bild_updated_at

      t.timestamps
    end
    add_index :referenz_bilder, :referenz_id
  end

  def self.down
    drop_table :referenz_bilder
  end
end
