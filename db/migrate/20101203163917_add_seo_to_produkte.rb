class AddSeoToProdukte < ActiveRecord::Migration
  def self.up
    remove_column :produkte, :datum
    remove_column :produkte, :inhalt
    add_column :produkte, :beispiel_produkt, :string
    add_column :produkte, :beispiel_beschreibung, :string
    add_column :produkte, :beispiel_preis, :decimal, :precision => 8, :scale => 2
    add_column :produkte, :beispiel_style_klasse, :string
    add_column :produkte, :produkt_url, :string
    add_column :produkte, :sku, :string, :default => ""
    add_column :produkte, :meta_description, :string, :default => ""
    add_column :produkte, :meta_keywords, :string, :default => ""
    add_column :seiten, :meta_description, :string, :default => ""
    add_column :seiten, :meta_keywords, :string, :default => ""
    add_index :produkte, :sku
  end

  def self.down
  end
end
