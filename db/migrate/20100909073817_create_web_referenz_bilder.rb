class CreateWebReferenzBilder < ActiveRecord::Migration
  def self.up
    create_table :web_referenz_bilder do |t|
      t.string :name
      t.string :titel
      t.text :inhalt
      t.integer :sorter
      t.references :web_referenz
      t.string :screenshot_file_name
      t.string :screenshot_content_type
      t.integer :screenshot_file_size
      t.datetime :screenshot_updated_at

      t.timestamps
    end
    add_index :web_referenz_bilder, :web_referenz_id
  end

  def self.down
    drop_table :web_referenz_bilder
  end
end
