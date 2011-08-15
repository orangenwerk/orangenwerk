class Mgmgt < ActiveRecord::Migration
  def self.up
    remove_column :banners, :title
    remove_column :sliders, :title
    add_column :banners, :titel, :string
    add_column :sliders, :titel, :string
  end

  def self.down
  end
end
