#  name                    :string(255)
#  sorter                  :integer(4)
#  web_referenz_id         :integer(4)
#  screenshot_file_name    :string(255)
class WebReferenzBild < ActiveRecord::Base
  
  default_scope :order => 'web_referenz_bilder.sorter ASC'
  
  has_attached_file :screenshot,
    :default_url => "/images/Top-Logo.png",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "60x50>",
      :klein => "120x100>",
      :shot => "800x900>",
      :big => "831x900>",
      :original => "838x800>"
    }
  
  belongs_to :web_referenz
  
  validates_attachment_presence :screenshot, :message => :attachment_presence
  
end
