#  name              :string(255)
#  titel             :string(255)
#  link_name         :string(255)
#  link_url          :string(255)
#  aktiv             :boolean(1)
#  link              :boolean(1)
#  all_aerea         :boolean(1)
#  zeitlimit         :boolean(1)
#  von               :datetime
#  bis               :datetime
#  bild_file_
class Aktion < ActiveRecord::Base
  
  has_attached_file :bild,
    :default_url => "/images/header_std.jpg",
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
    :styles => {
      :thumb => "80x50>",
      :original => "250x500>"
    }
    
    scope :random, lambda { |*args| {:order => 'RAND()', :limit => (args.first || 1), :conditions => ["created_at < ?", Time.now.utc] }}
    
    validates :name, :presence => true, :length => { :maximum => 35 }
    validates_attachment_presence :bild, :message => :attachment_presence
end
