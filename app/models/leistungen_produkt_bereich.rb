class LeistungenProduktBereich < ActiveRecord::Base
  belongs_to :leistung
  belongs_to :produkt_bereich
end
