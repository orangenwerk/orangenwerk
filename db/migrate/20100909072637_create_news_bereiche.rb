class CreateNewsBereiche < ActiveRecord::Migration
  def self.up
    create_table :news_bereiche do |t|
      t.string :name, :unique => true
      t.string :titel
      t.integer :sorter
      t.text :inhalt

      t.timestamps
    end
    add_index :news_bereiche, :name
  end

  def self.down
    drop_table :news_bereiche
  end
end
