#  name        :string(255)
#  titel       :string(255)
#  inhalt      :text
#  referenz_id :integer(4)
#  url         :string(255)
class WebReferenz < ActiveRecord::Base
  
  belongs_to :referenz
  
  has_many :web_referenz_bilder, :dependent => :destroy
  
  validates :name, :presence => true, :uniqueness => true, :length => { :within => 2..35 }
  validates :titel, :presence => true, :uniqueness => true, :length => { :within => 2..70 }
  validates :inhalt, :presence => true, :length => { :within => 5..3000 }
  validates :url, :presence => true

  
  accepts_nested_attributes_for :web_referenz_bilder, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
end
