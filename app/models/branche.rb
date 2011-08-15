#  name       :string(255)
#  titel      :string(255)
#  sorter     :integer(4)
class Branche < ActiveRecord::Base
  
  default_scope :order => 'branchen.sorter ASC'
  
  has_many :kunden
  has_many :referenzen
  
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 35 }
  validates :titel, :presence => true, :uniqueness => true, :length => { :maximum => 50 }
  

end
