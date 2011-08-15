#  name        :string(255)
#  kunden_name :string(255)
#  firma       :string(255)
#  inhalt      :text
#  kunde_id    :integer(4)
class KundenMeinung < ActiveRecord::Base
  
  scope :random, lambda { |*args| {:order => 'RAND()', :limit => (args.first || 1), :conditions => ["created_at < ?", Time.now.utc] }}
  
  belongs_to :kunde
  
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 35 }
  validates :kunden_name, :presence => true
  validates :firma, :presence => true
  validates :inhalt, :presence => true, :length => { :within => 5..700 }
  
end
