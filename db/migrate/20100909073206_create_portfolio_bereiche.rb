class CreatePortfolioBereiche < ActiveRecord::Migration
  def self.up
    create_table :portfolio_bereiche do |t|
      t.string :name, :unique => true
      t.string :titel
      t.integer :sorter
      t.text :inhalt

      t.timestamps
    end
    add_index :portfolio_bereiche, :name
  end

  def self.down
    drop_table :portfolio_bereiche
  end
end
