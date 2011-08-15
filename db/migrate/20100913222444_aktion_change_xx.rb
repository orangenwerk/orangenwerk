class AktionChangeXx < ActiveRecord::Migration
  def self.up
    remove_column :aktionen, :all_aerea
    add_column :aktionen, :all_area, :boolean
  end

  def self.down
  end
end
