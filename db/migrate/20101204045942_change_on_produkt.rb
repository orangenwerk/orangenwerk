class ChangeOnProdukt < ActiveRecord::Migration
  def self.up
    change_column :produkte, :beispiel_preis, :string
  end

  def self.down
  end
end
