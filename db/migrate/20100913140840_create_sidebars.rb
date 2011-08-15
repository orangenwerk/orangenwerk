class CreateSidebars < ActiveRecord::Migration
  def self.up
    create_table :sidebars do |t|
      t.string :name
      t.integer :sorter
      t.string :headline
      t.string :klasse
      t.string :geber
      t.text :inhalt

      t.timestamps
    end
  end

  def self.down
    drop_table :sidebars
  end
end
