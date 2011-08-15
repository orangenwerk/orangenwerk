class SeitenSidebar < ActiveRecord::Base
  belongs_to :seite
  belongs_to :sidebar
  
  before_save :fix_double_save
  
  private

    def fix_double_save
      helper = self.class.find(:all, :conditions => {  :seite_id       =>  self.seite_id, 
                                                       :sidebar_id =>  self.sidebar_id  })
      unless helper.blank?
        helper.each do |help|
          help.destroy
        end
      end  
    end

end
