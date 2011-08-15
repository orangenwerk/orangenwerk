#  name       :string(255)
#  titel      :string(255)
#  headline   :string(255)
#  inhalt     :text
#  sidebar_icon_file_name    :string(255)
class Seite < ActiveRecord::Base
  
  has_attached_file :sidebar_icon,
    # => :default_url => "/images/sidebar_icon_:style.png",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "60x50>",
      :original => "178x110>"
    }
  
  has_many :banners_seiten, :dependent => :destroy, :uniq => true
  has_many :banners, :through => :banners_seiten
  accepts_nested_attributes_for :banners_seiten, :allow_destroy => true, :reject_if => proc { |attr| attr["banner_id"].blank? }
  
  has_many :start_head_sliders, :dependent => :destroy
  accepts_nested_attributes_for :start_head_sliders, :allow_destroy => true
  
  has_many :seiten_sidebars, :dependent => :destroy, :uniq => true
  has_many :sidebars, :through => :seiten_sidebars
  accepts_nested_attributes_for :seiten_sidebars, :allow_destroy => true, :reject_if => proc { |attr| attr["sidebar_id"].blank? }
  
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 30 }, :inclusion => %w[home produkte portfolio news kontakt sitemap]
  
end
