#  name       :string(255)
#  titel      :string(255)
#  sorter     :integer(4)
#  inhalt     :text
#  sidebar_icon_file_name    :string(255)
class NewsBereich < ActiveRecord::Base
  
  has_attached_file :sidebar_icon,
    :default_url => "/images/sidebar_icon_:style.png",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "60x50>",
      :original => "178x110>"
    }
  
  default_scope :order => 'news_bereiche.sorter ASC'
  
  
  has_many :banners_news_bereiche, :dependent => :destroy
  has_many :banners, :through => :banners_news_bereiche
  accepts_nested_attributes_for :banners_news_bereiche, :allow_destroy => true, :reject_if => proc { |attr| attr["banner_id"].blank? }
  
  
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 35 }
  validates :titel, :presence => true, :uniqueness => true, :length => { :maximum => 50 }
  
end
