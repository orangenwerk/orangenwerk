class CreateSeitenSidebars < ActiveRecord::Migration
  def self.up
    create_table :seiten_sidebars do |t|
      t.references :seite
      t.references :sidebar

      t.timestamps
    end
    add_index :seiten_sidebars, :seite_id
    add_index :seiten_sidebars, :sidebar_id
  end

  def self.down
    drop_table :seiten_sidebars
  end
end
