#  name              :string(255)
#  link              :string(255)
#  sorter            :integer(4)
#  bild_file_
#  titel             :string(255)
class Banner < ActiveRecord::Base
  
  def child_columns
       self.class.columns.reject { |c| c.primary || c.name !=~ /(_id)$/ || c.name == inheritance_column }
  end  
  
  has_attached_file :bild,
    :default_url => "/images/header_std.jpg",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "278x43#",
      :original => "1665x258#"
    }
    
  has_many :banners_kontakt_bereiche, :dependent => :destroy
  has_many :kontakt_bereiche, :through => :banners_kontakt_bereiche
  accepts_nested_attributes_for :banners_kontakt_bereiche, :allow_destroy => true, :reject_if => proc { |attr| attr["kontakt_bereich_id"].blank? }
  
  has_many :banners_news_bereiche, :dependent => :destroy
  has_many :news_bereiche, :through => :banners_news_bereiche
  accepts_nested_attributes_for :banners_news_bereiche, :allow_destroy => true, :reject_if => proc { |attr| attr["news_bereich_id"].blank? }
  
  has_many :banners_produkte, :dependent => :destroy
  has_many :produkte, :through => :banners_produkte
  accepts_nested_attributes_for :banners_produkte, :allow_destroy => true, :reject_if => proc { |attr| attr["produkt_id"].blank? }
  
  has_many :banners_produkt_kategorien, :dependent => :destroy
  has_many :produkt_kategorien, :through => :banners_produkt_kategorien
  accepts_nested_attributes_for :banners_produkt_kategorien, :allow_destroy => true, :reject_if => proc { |attr| attr["produkt_kategorie_id"].blank? }
  
  has_many :banners_produkt_bereiche, :dependent => :destroy
  has_many :produkt_bereiche, :through => :banners_produkt_bereiche
  accepts_nested_attributes_for :banners_produkt_bereiche, :allow_destroy => true, :reject_if => proc { |attr| attr["produkt_bereich_id"].blank? }
  
  has_many :banners_seiten, :dependent => :destroy
  has_many :seiten, :through => :banners_seiten
  accepts_nested_attributes_for :banners_seiten, :allow_destroy => true, :reject_if => proc { |attr| attr["seite_id"].blank? }
  
  
    
  validates :name, :presence => true, :length => { :maximum => 35 }

  validates_attachment_presence :bild, :message => :attachment_presence
  
  
  
end
