class LeistungenProdukt < ActiveRecord::Base
  default_scope :order => 'position'
  
  belongs_to :leistung
  belongs_to :produkt
  
  acts_as_list :scope => :produkt
end
