class CreateFaqs < ActiveRecord::Migration
  def self.up
    create_table :faqs do |t|
      t.string :name, :unique => true
      t.string :titel
      t.string :frage
      t.text :antwort
      t.integer :sorter

      t.timestamps
    end
    add_index :faqs, :name
  end

  def self.down
    drop_table :faqs
  end
end
