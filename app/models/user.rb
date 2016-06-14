require 'bcrypt'


class User < ActiveRecord::Base
	include BCrypt

	has_many :votes
	belongs_to :songs

	 def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end 