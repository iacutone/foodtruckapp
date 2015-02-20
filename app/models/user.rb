class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  has_secure_password
  
  before_save :generate_token
  
  def generate_token
    self.token = Digest::SHA1::hexdigest([Time.now, rand].join) 
  end
  
  field :email,           type: String
  field :name,            type: String
  field :password_digest, type: String
  field :token, type: String
end
