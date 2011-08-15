#  name                      :string(255)
#  titel                     :string(255)
#  sorter                    :integer(4)
#  inhalt                    :text
#  icon_file_name            :string(255)
#  sidebar_icon_file_name    :string(255)
class ProduktBereich < ActiveRecord::Base
  
  default_scope :order => 'produkt_bereiche.sorter ASC'
  
  has_attached_file :icon,
    :default_url => "/images/p_icon_:style.png",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "60x47#",
      :klein => "102x80#",
      :original => "125x98#"
    }
    
  has_attached_file :sidebar_icon,
    # => :default_url => "/images/sidebar_icon_:style.png",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "60x50>",
      :original => "178x110>"
    }
  
  has_many :produkt_kategorien, :dependent => :destroy
  has_many :produkte, :through => :produkt_kategorien
  accepts_nested_attributes_for :produkt_kategorien, :allow_destroy => true
  
  has_many :kunden_produkt_bereiche, :dependent => :destroy
  has_many :kunden, :through => :kunden_produkt_bereiche
  accepts_nested_attributes_for :kunden_produkt_bereiche, :allow_destroy => true, :reject_if => proc { |attr| attr["kunde_id"].blank? }
  
  has_many :banners_produkt_bereiche, :dependent => :destroy, :uniq => true
  has_many :banners, :through => :banners_produkt_bereiche
  accepts_nested_attributes_for :banners_produkt_bereiche, :allow_destroy => true, :reject_if => proc { |attr| attr["banner_id"].blank? }
  
  has_many :produkt_bereiche_referenzen, :dependent => :destroy, :uniq => true
  has_many :referenzen, :through => :produkt_bereiche_referenzen
  accepts_nested_attributes_for :produkt_bereiche_referenzen, :allow_destroy => true, :reject_if => proc { |attr| attr["referenz_id"].blank? }
  
  has_many :produkt_bereiche_sidebars, :dependent => :destroy
  has_many :sidebars, :through => :produkt_bereiche_sidebars
  accepts_nested_attributes_for :produkt_bereiche_sidebars, :allow_destroy => true, :reject_if => proc { |attr| attr["sidebar_id"].blank? }
  
  has_many :produkt_bereiche_sliders, :dependent => :destroy
  has_many :sliders, :through => :produkt_bereiche_sliders
  accepts_nested_attributes_for :produkt_bereiche_sliders, :allow_destroy => true, :reject_if => proc { |attr| attr["slider_id"].blank? }
  
  has_many :leistungen_produkt_bereiche, :dependent => :destroy, :uniq => true
  has_many :leistungen, :through => :leistungen_produkt_bereiche
  accepts_nested_attributes_for :leistungen_produkt_bereiche, :allow_destroy => true, :reject_if => proc { |attr| attr["leistung_id"].blank? }
  
  
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 35 }
  validates :titel, :presence => true, :uniqueness => true, :length => { :maximum => 50 }

  validates_attachment_presence :icon, :message => :attachment_presence
  
end
