class SliderFieldsChange < ActiveRecord::Migration
  def self.up
    remove_column :sliders, :dauer
    add_column :sliders, :dauer, :integer
  end

  def self.down
    remove_column :sliders, :dauer
    add_column :sliders, :dauer, :string
  end
end
