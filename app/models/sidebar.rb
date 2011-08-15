#  name       :string(255)
#  sorter     :integer(4)
#  headline   :string(255)
#  klasse     :string(255)
#  geber      :string(255)
#  inhalt     :text
class Sidebar < ActiveRecord::Base
  
  has_many :seiten_sidebars, :dependent => :destroy
  has_many :seiten, :through => :seiten_sidebars
  accepts_nested_attributes_for :seiten_sidebars, :allow_destroy => true, :reject_if => proc { |attr| attr["seite_id"].blank? }
  
  has_many :produkt_bereiche_sidebars, :dependent => :destroy
  has_many :produkt_bereiche, :through => :produkt_bereiche_sidebars
  accepts_nested_attributes_for :produkt_bereiche_sidebars, :allow_destroy => true, :reject_if => proc { |attr| attr["produkt_bereich_id"].blank? }
  
  validates :name, :presence => true, :length => { :maximum => 50 }

  
end
