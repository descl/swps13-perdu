class Objet < ActiveRecord::Base
  attr_accessible :category, :name
  
  attr_accessible :picture
  has_attached_file :picture, :styles => { :medium => "600x600>", :thumb => "200x200>" }
end
