class Location
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :truck
  
  field :latitude,   type: String
  field :longtitude, type: String
end
