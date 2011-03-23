class User < ActiveRecord::Base
  
  attr_accessor :old_password
    
  acts_as_authentic
  
  has_many :lists

end
