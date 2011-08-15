class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.string :name
      t.string :title
      t.string :link
      t.integer :sorter
      t.string :bild_file_name
      t.string :bild_content_type
      t.integer :bild_file_size
      t.datetime :bild_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end
