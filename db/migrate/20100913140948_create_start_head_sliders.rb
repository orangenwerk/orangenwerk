class CreateStartHeadSliders < ActiveRecord::Migration
  def self.up
    create_table :start_head_sliders do |t|
      t.string :name
      t.integer :sorter
      t.string :headline
      t.text :inhalt
      t.string :bild_file_name
      t.string :bild_content_type
      t.integer :bild_file_size
      t.datetime :bild_updated_at
      t.references :seite

      t.timestamps
    end
    add_index :start_head_sliders, :seite_id
  end

  def self.down
    drop_table :start_head_sliders
  end
end
