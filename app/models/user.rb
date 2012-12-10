class User < ActiveRecord::Base
  attr_accessible :role, :username, :userpwd
end
