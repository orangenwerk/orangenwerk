#  name              :string(255)
#  objekt            :string(255)
#  ort               :string(255)
#  webref            :boolean(1)
#  branche_id        :integer(4)
#  icon_file_name    :string(255)
#  datum             :datetime
class Referenz < ActiveRecord::Base
  
  def child_columns
      @child_columns = self.class.columns.reject { |c| c.name !~ /(_id)$/  }
      @child_columns
  end
  
  has_attached_file :icon,
    :default_url => "/images/emergency_:style.png",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "60x45#",
      :k_icon => "102x80#",
      :o_icon => "125x98#",
      :klein => "120x90#",
      :kmed => "156x117#",
      :medium => "160x120#",
      :nav => "200x150#",
      :original => "900x650>"
    }
  
  scope :random, lambda { |*args| {:order => 'RAND()', :limit => (args.first || 1)}}
    
  belongs_to :branche
  
  has_many :produkt_bereiche_referenzen, :dependent => :destroy
  has_many :produkt_bereiche, :through => :produkt_bereiche_referenzen
  accepts_nested_attributes_for :produkt_bereiche_referenzen, :allow_destroy => true, :reject_if => proc { |attr| attr["produkt_bereich_id"].blank? }
  
  has_many :produkt_kategorien_referenzen, :dependent => :destroy
  has_many :produkt_kategorien, :through => :produkt_kategorien_referenzen
  accepts_nested_attributes_for :produkt_kategorien_referenzen, :allow_destroy => true, :reject_if => proc { |attr| attr["produkt_kategorien_referenz_id"].blank? }
  
  has_many :produkte_referenzen, :dependent => :destroy
  has_many :produkte, :through => :produkte_referenzen
  accepts_nested_attributes_for :produkte_referenzen, :allow_destroy => true, :reject_if => proc { |attr| attr["produkt_id"].blank? }
  
  has_many :referenz_bilder, :dependent => :destroy
  accepts_nested_attributes_for :referenz_bilder, :allow_destroy => true, :reject_if => proc { |attr| attr["icon_file_name"].blank? }
  
  has_many :web_referenzen, :dependent => :destroy
  accepts_nested_attributes_for :web_referenzen, :allow_destroy => true, :reject_if => proc { |attr| attr["name"].blank? }
  
  has_many :web_referenz_bilder, :through => :web_referenzen
  
  
  validates :name, :presence => true, :length => { :maximum => 30 }
  
  validates :objekt, :presence => true, :length => { :maximum => 40 }
  
  validates :ort, :presence => true, :length => { :maximum => 50 }
  
  validates_attachment_presence :icon, :message => :attachment_presence
  
  accepts_nested_attributes_for :referenz_bilder, :reject_if => lambda { |a| a[:bild].blank? }, :allow_destroy => true
  
  accepts_nested_attributes_for :web_referenzen, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
end
