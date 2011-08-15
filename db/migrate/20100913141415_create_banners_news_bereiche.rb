class CreateBannersNewsBereiche < ActiveRecord::Migration
  def self.up
    create_table :banners_news_bereiche do |t|
      t.references :banner
      t.references :news_bereich

      t.timestamps
    end
    add_index :banners_news_bereiche, :banner_id
    add_index :banners_news_bereiche, :news_bereich_id
  end

  def self.down
    drop_table :banners_news_bereiche
  end
end
