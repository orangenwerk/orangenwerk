class BannersProdukt < ActiveRecord::Base
  belongs_to :banner
  belongs_to :produkt
  
  before_save :fix_double_save
  
  private

    def fix_double_save
      helper = self.class.find(:all, :conditions => {  :banner_id       =>  self.banner_id, 
                                                       :produkt_id =>  self.produkt_id  })
      unless helper.blank?
        helper.each do |help|
          help.destroy
        end
      end  
    end


    
end
