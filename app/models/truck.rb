class Truck
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_many :locations
  
  field :name, type: String
end
