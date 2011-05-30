class User < ActiveRecord::Base
has_one :address
has_many :posts

acts_as_authentic

end

