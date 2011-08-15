class NavIcon < ActiveRecord::Migration
  def self.up
    add_column :portfolio_bereiche, :sidebar_icon_file_name, :string
    add_column :portfolio_bereiche, :sidebar_icon_content_type, :string
    add_column :portfolio_bereiche, :sidebar_icon_file_size, :integer
    add_column :portfolio_bereiche, :sidebar_icon_updated_at, :datetime
    
    add_column :news_bereiche, :sidebar_icon_file_name, :string
    add_column :news_bereiche, :sidebar_icon_content_type, :string
    add_column :news_bereiche, :sidebar_icon_file_size, :integer
    add_column :news_bereiche, :sidebar_icon_updated_at, :datetime
    
    add_column :kontakt_bereiche, :sidebar_icon_file_name, :string
    add_column :kontakt_bereiche, :sidebar_icon_content_type, :string
    add_column :kontakt_bereiche, :sidebar_icon_file_size, :integer
    add_column :kontakt_bereiche, :sidebar_icon_updated_at, :datetime
    
    add_column :seiten, :sidebar_icon_file_name, :string
    add_column :seiten, :sidebar_icon_content_type, :string
    add_column :seiten, :sidebar_icon_file_size, :integer
    add_column :seiten, :sidebar_icon_updated_at, :datetime
  end

  def self.down
    remove_column :portfolio_bereiche, :sidebar_icon_file_name, :string
    remove_column :portfolio_bereiche, :sidebar_icon_content_type, :string
    remove_column :portfolio_bereiche, :sidebar_icon_file_size, :integer
    remove_column :portfolio_bereiche, :sidebar_icon_updated_at, :datetime
    
    remove_column :news_bereiche, :sidebar_icon_file_name, :string
    remove_column :news_bereiche, :sidebar_icon_content_type, :string
    remove_column :news_bereiche, :sidebar_icon_file_size, :integer
    remove_column :news_bereiche, :sidebar_icon_updated_at, :datetime
    
    remove_column :kontakt_bereiche, :sidebar_icon_file_name, :string
    remove_column :kontakt_bereiche, :sidebar_icon_content_type, :string
    remove_column :kontakt_bereiche, :sidebar_icon_file_size, :integer
    remove_column :kontakt_bereiche, :sidebar_icon_updated_at, :datetime
    
    remove_column :seiten, :sidebar_icon_file_name, :string
    remove_column :seiten, :sidebar_icon_content_type, :string
    remove_column :seiten, :sidebar_icon_file_size, :integer
    remove_column :seiten, :sidebar_icon_updated_at, :datetime
  end
end
