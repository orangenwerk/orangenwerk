#  name                      :string(255)
#  titel                     :string(255)
#  sorter                    :integer(4)
#  inhalt                    :text
#  beschreibung              :text
#  produkt_kategorie_id      :integer(4)
#  icon_file_name            :string(255)
#  produktbild_file_name     :string(255)
#  sidebar_icon_file_name    :string(255)
#  datum                     :datetime
class Produkt < ActiveRecord::Base
  
  default_scope :order => 'produkte.sorter ASC'
  
  has_attached_file :icon,
    :default_url => "/images/p_icon_:style.png",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "60x47#",
      :klein => "102x80#",
      :original => "125x98#"
    }
  
  has_attached_file :produktbild,
    :default_url => "/images/produkte/produkt_bild_emergency_:style.jpg",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "145x67>",
      :klein => "290x137>",
      :mittel => '423x200>',
      :original => "580x274>"
    }
    
  has_attached_file :sidebar_icon,
    # => :default_url => "/images/sidebar_icon_:style.png",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "60x50>",
      :original => "178x110>"
    }
  
  
  before_save :slug_link
  
  
  belongs_to :produkt_kategorie
  
  has_many :produkt_detail_bilder, :dependent => :destroy
  accepts_nested_attributes_for :produkt_detail_bilder, :allow_destroy => true
  
  has_many :banners_produkte, :dependent => :destroy, :uniq => true
  has_many :banners, :through => :banners_produkte
  accepts_nested_attributes_for :banners_produkte, :allow_destroy => true, :reject_if => proc { |attr| attr["banner_id"].blank? }
  
  has_many :produkte_referenzen, :dependent => :destroy, :uniq => true
  has_many :referenzen, :through => :produkte_referenzen
  accepts_nested_attributes_for :produkte_referenzen, :allow_destroy => true, :reject_if => proc { |attr| attr["referenz_id"].blank? }
  
  has_many :leistungen_produkte, :dependent => :destroy, :uniq => true
  has_many :leistungen, :through => :leistungen_produkte, :order => 'leistungen_produkte.position'
  accepts_nested_attributes_for :leistungen_produkte, :allow_destroy => true, :reject_if => proc { |attr| attr["leistung_id"].blank? }
  
  
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 30 }
  validates :titel, :presence => true, :length => { :maximum => 50 }

  validates :beschreibung, :presence => true
  
  validates_attachment_presence :icon, :message => :attachment_presence
  
  
  
  private
    def slug_link
      self.produkt_url = '/'+self.produkt_kategorie.produkt_bereich.name+'/'+self.produkt_kategorie.name+'/'+self.name
    end
  
end
