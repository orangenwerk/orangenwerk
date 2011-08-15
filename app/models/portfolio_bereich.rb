#  name       :string(255)
#  titel      :string(255)
#  sorter     :integer(4)
#  inhalt     :text
#  sidebar_icon_file_name    :string(255)
class PortfolioBereich < ActiveRecord::Base
  
  has_attached_file :sidebar_icon,
    :default_url => "/images/sidebar_icon_:style.png",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "60x50>",
      :original => "178x110>"
    }
  
  default_scope :order => 'portfolio_bereiche.sorter ASC'
  
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 35 }
  
  validates :titel, :presence => true, :uniqueness => true, :length => { :maximum => 50 }
  
  has_many :portfolio_bereiche_sliders, :dependent => :destroy
  has_many :sliders, :through => :portfolio_bereiche_sliders
  accepts_nested_attributes_for :portfolio_bereiche_sliders, :allow_destroy => true, :reject_if => proc { |attr| attr["slider_id"].blank? }
  
  
end
