require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text

  has n, :links, through: Resource
  attr_reader :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  @@count = 0

  def count
    @@count
  end


  def initialize(params)
    self.password = params[:password]
    self.password = params[:password_confirm]
    self.email = params[:email]
    self.save
    @@count += 1
  end

end
