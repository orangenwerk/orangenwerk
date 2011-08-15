#  name              :string(255)
#  link              :string(255)
#  sorter            :integer(4)
#  bild_file_name    :string(255)
#  titel             :string(255)
#  von_horizontal    :string(255)
#  von_vertikal      :string(255)
#  von_zoom          :string(255)
#  zu_horizontal     :string(255)
#  zu_vertikal       :string(255)
#  zu_zoom           :string(255)
#  dauer             :integer(4)
class Slider < ActiveRecord::Base
  
  has_attached_file :bild,
    :default_url => "/images/header_std.jpg",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "285x50>",
      :original => "1800x400>"
    }
  
  default_scope :order => 'sliders.sorter ASC'
    
  has_many :portfolio_bereiche_sliders, :dependent => :destroy
  has_many :portfolio_bereiche, :through => :portfolio_bereiche_sliders
  accepts_nested_attributes_for :portfolio_bereiche_sliders, :allow_destroy => true, :reject_if => proc { |attr| attr["portfolio_bereich_id"].blank? }
  
  has_many :produkt_bereiche_sliders, :dependent => :destroy
  has_many :produkt_bereiche, :through => :produkt_bereiche_sliders
  accepts_nested_attributes_for :produkt_bereiche_sliders, :allow_destroy => true, :reject_if => proc { |attr| attr["produkt_bereich_id"].blank? }
    
  validates :name, :presence => true, :length => { :within => 2..50 }

  validates_attachment_presence :bild, :message => :attachment_presence
  
end
