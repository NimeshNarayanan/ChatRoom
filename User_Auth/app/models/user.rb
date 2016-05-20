class User < ActiveRecord::Base
  has_many :stickies
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create #validating the format of email
  validates :encrypted_password, :presence => true , :confirmation => true, :length => {:in =>2..15} #password_confirmation attr
end
