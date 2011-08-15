class CreateNewsletterAbos < ActiveRecord::Migration
  def self.up
    create_table :newsletter_abos do |t|
      t.string :geschlecht
      t.string :name
      t.string :email

      t.timestamps
    end
    add_index :newsletter_abos, :email
  end

  def self.down
    drop_table :newsletter_abos
  end
end
