class Leistung < ActiveRecord::Base
  
  has_many :leistungen_produkte, :dependent => :destroy, :uniq => true
  has_many :produkte, :through => :leistungen_produkte, :order => 'leistungen_produkte.position'
  accepts_nested_attributes_for :leistungen_produkte, :allow_destroy => true, :reject_if => proc { |attr| attr["produkt_id"].blank? }
  
  has_many :leistungen_produkt_bereiche, :dependent => :destroy, :uniq => true
  has_many :produkt_bereiche, :through => :leistungen_produkt_bereiche
  accepts_nested_attributes_for :leistungen_produkt_bereiche, :allow_destroy => true, :reject_if => proc { |attr| attr["produkt_bereich_id"].blank? }
  
  
end
