#  name       :string(255)
#  titel      :string(255)
#  headline   :string(255)
#  datum      :datetime
#  autor      :string(255)
#  inhalt     :text
class NewsEintrag < ActiveRecord::Base
  
  default_scope :order => 'news_eintraege.datum DESC'
  
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 55 }
  validates :headline, :presence => true
  validates :datum, :presence => true
  validates :autor, :presence => true
  validates :inhalt, :presence => true, :length => { :within => 2..5000 }
  
end
