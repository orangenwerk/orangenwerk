class CreateNewsEintraege < ActiveRecord::Migration
  def self.up
    create_table :news_eintraege do |t|
      t.string :name
      t.string :titel
      t.string :headline
      t.datetime :datum
      t.string :autor
      t.text :inhalt

      t.timestamps
    end
    add_index :news_eintraege, :name
    add_index :news_eintraege, :datum
  end

  def self.down
    drop_table :news_eintraege
  end
end
