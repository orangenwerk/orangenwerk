class ChildUnifier
  
    def initialize(target)  
      @target = target  
    end
  
    def fix_double_save
      recorda = self.class.find(:first, :conditions => {self.class.child_columns => self.child_columns})
      unless recorda.blank?    
        recorda.destroy
      end  
    end

    def child_columns
      @child_columns = self.class.columns.reject { |c| c.name !~ /(_id)$/  }
      @child_columns
    end
    
      private
  
    def child_columns
      @child_columns = self.class.columns.reject { |c| c.name !~ /(_id)$/  }
      @childa = Hash.new
      @child_columns.each do |cc|
        @childa = { cc.name => 'self.'+cc.name}
      end
      @childa
    end

    def fix_double_save
      banners_kontakt_bereich = BannersKontaktBereich.find(:first, :conditions => child_columns  )
      unless banners_kontakt_bereich.blank?    
        banners_kontakt_bereich.destroy
      end  
    end
  
    
    
end