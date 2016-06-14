class Song < ActiveRecord::Base
	
	validates :title, presence: true
	validates :author, presence: true
	has_many :votes
	belongs_to :user

end 