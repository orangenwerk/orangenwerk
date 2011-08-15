class CreateBannersKontaktBereiche < ActiveRecord::Migration
  def self.up
    create_table :banners_kontakt_bereiche do |t|
      t.references :banner
      t.references :kontakt_bereich

      t.timestamps
    end
    add_index :banners_kontakt_bereiche, :banner_id
    add_index :banners_kontakt_bereiche, :kontakt_bereich_id
  end

  def self.down
    drop_table :banners_kontakt_bereiche
  end
end
