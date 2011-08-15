class PostionForAgb < ActiveRecord::Migration
  def self.up
    add_column :agbs, :position, :integer
  end

  def self.down
    remove_column :agbs, :position
  end
end
