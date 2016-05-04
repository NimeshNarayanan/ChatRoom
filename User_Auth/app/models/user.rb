class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates_format_of:
  validates :encrypted_password, :presence => true , :confirmation => true #password_confirmation attr
end
