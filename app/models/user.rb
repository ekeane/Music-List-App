class User < ActiveRecord::Base
	
	has_many :votes
	belongs_to :songs

end 