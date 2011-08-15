class SliderFields < ActiveRecord::Migration
  def self.up
    add_column :sliders, :von_horizontal, :string
    add_column :sliders, :von_vertikal, :string
    add_column :sliders, :von_zoom, :string
    add_column :sliders, :zu_horizontal, :string
    add_column :sliders, :zu_vertikal, :string
    add_column :sliders, :zu_zoom, :string
    add_column :sliders, :dauer, :string
  end

  def self.down
    remove_column :sliders, :von_horizontal
    remove_column :sliders, :von_vertikal
    remove_column :sliders, :von_zoom
    remove_column :sliders, :zu_horizontal
    remove_column :sliders, :zu_vertikal
    remove_column :sliders, :zu_zoom
    remove_column :sliders, :dauer
  end
end
