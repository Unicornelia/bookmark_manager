require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, Text

  has n, :links, through: Resource
  attr_reader :password

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
