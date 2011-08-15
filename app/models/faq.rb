#  name       :string(255)
#  frage      :string(255)
#  antwort    :text
#  sorter     :integer(4)
class Faq < ActiveRecord::Base
  
  default_scope :order => 'faqs.sorter ASC'
  
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 35 }
  
  validates :frage, :presence => true, :uniqueness => true, :length => { :within => 1..300 }
  
  validates :antwort, :presence => true, :length => { :within => 2..2500 }
  
end
