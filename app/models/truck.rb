class Truck
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_secure_password
  
  has_many :locations
  
  validates_uniqueness_of :name
  
  field :name,            type: String
  field :email,           type: String
  field :token,           type: String
  field :password_confirmation, type: String
  
  before_save :generate_token
  
  def generate_token
     self.token = Digest::SHA1.hexdigest([self.id, Time.now, rand].join)
  end
end
