class ProduktKategorienReferenz < ActiveRecord::Base
  belongs_to :produkt_kategorie
  belongs_to :referenz
  
  before_save :fix_double_save
  
  private

    def fix_double_save
      helper = self.class.find(:all, :conditions => {  :produkt_kategorie_id       =>  self.produkt_kategorie_id, 
                                                       :referenz_id =>  self.referenz_id  })
      unless helper.blank?
        helper.each do |help|
          help.destroy
        end
      end  
    end

end
