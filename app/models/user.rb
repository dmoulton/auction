class User < ActiveRecord::Base
  attr_accessible :email, :last_login, :name
end
