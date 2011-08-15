class XmailKontakt
  include ActiveModel::Translation
  include ActiveModel::Validations  
  include ActiveModel::Conversion  
  extend ActiveModel::Naming  
    
  attr_accessor :geschlecht, :name, :vorname, :email, :inhalt, :sicherheits_code
  
  validates :geschlecht, :presence => true, 
                    :inclusion => %w[Herr Frau]
  
  validates :name, :presence => true, 
                    :length => {:minimum => 3, :maximum => 80}
                    
  validates :email, :presence => true, 
                    :length => {:maximum => 254},  # => :length => {:minimum => 3, :maximum => 254}
                    :email => true
                    
  validates :inhalt, :presence => true, 
                    :length => {:minimum => 3, :maximum => 1000}
  
  
  validates :sicherheits_code, :presence => true, 
                    :inclusion => %w[8 acht Acht ACHT]
    
  def initialize(attributes = {})  
    attributes.each do |name, value|  
      send("#{name}=", value)  
    end  
  end  
    
  def persisted?  
    false  
  end  

end