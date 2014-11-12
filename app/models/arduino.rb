class Arduino < ActiveRecord::Base
  belongs_to :user

  attr_accessible :mac, :name
  
  validates_presence_of :mac, :name
  
end
