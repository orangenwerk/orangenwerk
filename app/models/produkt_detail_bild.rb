#  name              :string(255)
#  sorter            :integer(4)
#  produkt_id        :integer(4)
#  icon_file_name    :string(255)
class ProduktDetailBild < ActiveRecord::Base
  
  has_attached_file :icon,
    :default_url => "/images/p_icon_:style.png",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "60x45#",
      :k_icon => "102x80#",
      :o_icon => "125x98#",
      :klein => "120x90#",
      :kmed => "156x117#",
      :medium => "160x120#",
      :nav => "200x150#",
      :original => "800x600>"
    }
  
  default_scope :order => 'produkt_detail_bilder.sorter ASC'
  
  belongs_to :produkt
  
  validates_attachment_presence :icon, :message => :attachment_presence

end
