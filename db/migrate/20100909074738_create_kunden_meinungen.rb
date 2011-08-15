class CreateKundenMeinungen < ActiveRecord::Migration
  def self.up
    create_table :kunden_meinungen do |t|
      t.string :name
      t.string :titel
      t.string :kunden_name
      t.string :firma
      t.text :inhalt
      t.references :kunde

      t.timestamps
    end
  end

  def self.down
    drop_table :kunden_meinungen
  end
end
