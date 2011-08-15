class CreateAktionen < ActiveRecord::Migration
  def self.up
    create_table :aktionen do |t|
      t.string :name
      t.string :titel
      t.string :link_name
      t.string :link_url
      t.boolean :aktiv
      t.boolean :link
      t.boolean :all_aerea
      t.boolean :zeitlimit
      t.datetime :von
      t.datetime :bis
      t.string :bild_file_name
      t.string :bild_content_type
      t.integer :bild_file_size
      t.datetime :bild_updated_at

      t.timestamps
    end
    add_index :aktionen, :name
  end

  def self.down
    drop_table :aktionen
  end
end
