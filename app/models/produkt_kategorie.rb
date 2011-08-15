#  name                      :string(255)
#  titel                     :string(255)
#  sorter                    :integer(4)
#  inhalt                    :text
#  produkt_bereich_id        :integer(4)
#  icon_file_name            :string(255)
#  sidebar_icon_file_name    :string(255)
class ProduktKategorie < ActiveRecord::Base
  
  default_scope :order => 'produkt_kategorien.sorter ASC'
  
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
  
  belongs_to :produkt_bereich
  
  has_many :produkte, :dependent => :destroy
  accepts_nested_attributes_for :produkte, :allow_destroy => true
  
  has_many :banners_produkt_kategorien, :dependent => :destroy, :uniq => true
  has_many :banners, :through => :banners_produkt_kategorien
  accepts_nested_attributes_for :banners_produkt_kategorien, :allow_destroy => true, :reject_if => proc { |attr| attr["banner_id"].blank? }
  
  has_many :produkt_kategorien_referenzen, :dependent => :destroy, :uniq => true
  has_many :referenzen, :through => :produkt_kategorien_referenzen
  accepts_nested_attributes_for :produkt_kategorien_referenzen, :allow_destroy => true, :reject_if => proc { |attr| attr["referenz_id"].blank? }
  
  
  
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 35 }
  
  validates :titel, :presence => true, :uniqueness => true, :length => { :maximum => 50 }
  
  
  validates_attachment_presence :icon, :message => :attachment_presence
  
end
