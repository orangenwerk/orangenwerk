class BiGxChanges < ActiveRecord::Migration
  def self.up
    
    remove_column :referenzen, :inhalt
    remove_column :web_referenz_bilder, :titel
    remove_column :web_referenz_bilder, :inhalt
    
    remove_index :referenzen, :produkt_bereich_id
    remove_index :referenzen, :produkt_kategorie_id
    remove_index :referenzen, :produkt_id
    
    add_column :produkt_bereiche, :sidebar_icon_file_name, :string
    add_column :produkt_bereiche, :sidebar_icon_content_type, :string
    add_column :produkt_bereiche, :sidebar_icon_file_size, :integer
    add_column :produkt_bereiche, :sidebar_icon_updated_at, :datetime
    
    add_column :produkt_kategorien, :sidebar_icon_file_name, :string
    add_column :produkt_kategorien, :sidebar_icon_content_type, :string
    add_column :produkt_kategorien, :sidebar_icon_file_size, :integer
    add_column :produkt_kategorien, :sidebar_icon_updated_at, :datetime
    
    add_column :produkte, :sidebar_icon_file_name, :string
    add_column :produkte, :sidebar_icon_content_type, :string
    add_column :produkte, :sidebar_icon_file_size, :integer
    add_column :produkte, :sidebar_icon_updated_at, :datetime
    
    add_column :web_referenzen, :url, :string
    add_column :produkte, :datum, :datetime
  end

  def self.down
    remove_column :web_referenzen, :url, :string
    remove_column :produkte, :datum, :datetime
  end
end