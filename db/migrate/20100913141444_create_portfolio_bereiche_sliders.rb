class CreatePortfolioBereicheSliders < ActiveRecord::Migration
  def self.up
    create_table :portfolio_bereiche_sliders do |t|
      t.references :portfolio_bereich
      t.references :slider

      t.timestamps
    end
    add_index :portfolio_bereiche_sliders, :portfolio_bereich_id
    add_index :portfolio_bereiche_sliders, :slider_id
  end

  def self.down
    drop_table :portfolio_bereiche_sliders
  end
end
