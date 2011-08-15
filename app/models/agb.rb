#  name       :string(255)
#  headline   :string(255)
#  inhalt     :text
#  paragraf   :string(255)
class Agb < ActiveRecord::Base
  
  default_scope :order => 'position'
  
  acts_as_list
  
  validates :name, :presence => true, :length => { :maximum => 35 }

  validates :headline, :presence => true, :length => { :maximum => 140 }
  
  validates :inhalt, :presence => true, :length => { :maximum => 5000 }
  
  validates :paragraf, :presence => true, :uniqueness => true
  
end
