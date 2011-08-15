class CreateBannersSeiten < ActiveRecord::Migration
  def self.up
    create_table :banners_seiten do |t|
      t.references :banner
      t.references :seite

      t.timestamps
    end
    add_index :banners_seiten, :banner_id
    add_index :banners_seiten, :seite_id
  end

  def self.down
    drop_table :banners_seiten
  end
end
