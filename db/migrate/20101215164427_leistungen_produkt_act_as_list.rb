class LeistungenProduktActAsList < ActiveRecord::Migration
  def self.up
    add_column :leistungen_produkte, :position, :integer
    add_index :leistungen_produkte, :position
  end

  def self.down
  end
end
