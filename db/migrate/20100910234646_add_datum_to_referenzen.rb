class AddDatumToReferenzen < ActiveRecord::Migration
  def self.up
    add_column :referenzen, :datum, :datetime
  end

  def self.down
    remove_column :referenzen, :datum
  end
end
