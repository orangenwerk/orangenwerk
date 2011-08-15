#  name              :string(255)
#  sorter            :integer(4)
#  headline          :string(255)
#  inhalt            :text
#  bild_file_name    :string(255)
class StartHeadSlider < ActiveRecord::Base
  
  belongs_to :seite
  
  validates :name, :presence => true, :length => { :maximum => 20 }
  
  has_attached_file :bild,
    :default_url => "/images/header_std.jpg",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "285x50>",
      :bild => "1038x258#",
      :original => "1800x400>"
    }
end
