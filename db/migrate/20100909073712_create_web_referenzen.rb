class CreateWebReferenzen < ActiveRecord::Migration
  def self.up
    create_table :web_referenzen do |t|
      t.string :name, :unique => true
      t.string :titel
      t.text :inhalt
      t.references :referenz

      t.timestamps
    end
    add_index :web_referenzen, :name
    add_index :web_referenzen, :referenz_id
  end

  def self.down
    drop_table :web_referenzen
  end
end
