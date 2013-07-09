class RefrerenzChange < ActiveRecord::Migration
  def self.up
    add_column :referenzen, :branche_id, :integer
    remove_column :referenzen, :banche_id
  end

  def self.down
  end
end
