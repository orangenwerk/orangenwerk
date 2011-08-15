#  name              :string(255)
#  titel             :string(255)
#  datum             :datetime
#  branche_id        :integer(4)
#  icon_file_name    :string(255)
class Kunde < ActiveRecord::Base
  
  has_attached_file :icon,
    :default_url => "/images/p_icon_:style.png",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "60x45>",
      :klein => "120x90>",
      :kmed => "156x117>",
      :medium => "160x120>",
      :nav => "200x150>",
      :original => "300x200>"
    }
  
  scope :random, lambda { |*args| {:order => 'RAND()', :limit => (args.first || 1), :conditions => ["created_at < ?", Time.now.utc] }}
    
  belongs_to :branche
  
  has_many :kunden_produkt_bereiche, :dependent => :destroy
  has_many :produkt_bereiche, :through => :kunden_produkt_bereiche
  accepts_nested_attributes_for :kunden_produkt_bereiche, :allow_destroy => true, :reject_if => proc { |attr| attr["produkt_bereich_id"].blank? }
  
  has_many :kunden_meinungen
  
  validates :name, :presence => true, :uniqueness => true, :length => { :within => 2..35 }
  
  validates :titel, :presence => true, :uniqueness => true, :length => { :within => 5..50 }
  
  
  validates_attachment_presence :icon, :message => :attachment_presence
  
end
