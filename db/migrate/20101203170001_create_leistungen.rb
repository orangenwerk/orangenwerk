class CreateLeistungen < ActiveRecord::Migration
  def self.up
    create_table :leistungen do |t|
      t.string :inhalt
      t.timestamps
    end
  end

  def self.down
    drop_table :leistungen
  end
end
