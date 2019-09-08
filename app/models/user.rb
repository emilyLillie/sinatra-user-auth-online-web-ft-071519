# makes sure user cant sign up without name, email, and pw 

class User < ActiveRecord::Base
  validates_presence_of :name, :email, :password
end