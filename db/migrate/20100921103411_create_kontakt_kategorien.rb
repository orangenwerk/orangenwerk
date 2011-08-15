class CreateKontaktKategorien < ActiveRecord::Migration
  def self.up
    create_table :kontakt_kategorien do |t|
      t.string :name
      t.string :titel
      t.text :inhalt
      t.integer :sorter
      t.references :kontakt_bereich
      t.string :sidebar_icon_file_name
      t.string :sidebar_icon_content_type
      t.integer :sidebar_icon_file_size
      t.datetime :sidebar_icon_updated_at

      t.timestamps
    end
    add_index :kontakt_kategorien, :name
    add_index :kontakt_kategorien, :kontakt_bereich_id
  end

  def self.down
    drop_table :kontakt_kategorien
  end
end
