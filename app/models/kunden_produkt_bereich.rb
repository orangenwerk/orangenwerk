class KundenProduktBereich < ActiveRecord::Base
  belongs_to :kunde
  belongs_to :produkt_bereich
  
  before_save :fix_double_save
  
  private

    def fix_double_save
      helper = self.class.find(:all, :conditions => {  :kunde_id       =>  self.kunde_id, 
                                                       :produkt_bereich_id =>  self.produkt_bereich_id  })
      unless helper.blank?
        helper.each do |help|
          help.destroy
        end
      end  
    end


end
