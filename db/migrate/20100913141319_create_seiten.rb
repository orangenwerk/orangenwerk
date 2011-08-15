class CreateSeiten < ActiveRecord::Migration
  def self.up
    create_table :seiten do |t|
      t.string :name
      t.string :titel
      t.string :headline
      t.text :inhalt

      t.timestamps
    end
    add_index :seiten, :name
  end

  def self.down
    drop_table :seiten
  end
end
