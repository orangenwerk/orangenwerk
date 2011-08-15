class KontaktKategorie < ActiveRecord::Base
  
  has_attached_file :sidebar_icon,
    # => :default_url => "/images/sidebar_icon_:style.png",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "60x50>",
      :original => "178x110>"
    }
  
  default_scope :order => 'kontakt_kategorien.sorter ASC'
  
  belongs_to :kontakt_bereich
  
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 30 }
  validates :titel, :presence => true, :length => { :maximum => 50 }

  validates :inhalt, :presence => true, :length => { :within => 5..5000 }
  
  
end
