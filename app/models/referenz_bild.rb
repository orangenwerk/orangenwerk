#  name              :string(255)
#  inhalt            :text
#  sorter            :integer(4)
#  referenz_id       :integer(4)
#  bild_file_name    :string(255)
class ReferenzBild < ActiveRecord::Base
  
  default_scope :order => 'referenz_bilder.sorter ASC'
  
  has_attached_file :bild,
    :default_url => "/images/emergency_:style.png",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "60x50>",
      :klein => "120x90>",
      :medium => "300x250>",
      :original => "900x750>"
    }
    
    
  belongs_to :referenz
  
  validates :name, :length => { :maximum => 50 }

  
  validates_attachment_presence :bild, :message => :attachment_presence
  
end
