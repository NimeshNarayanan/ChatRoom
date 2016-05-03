class User < ActiveRecord::Base
  attr_accessor :password
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :encrypted_password , :confirmation => true #password_confirmation attr
end
