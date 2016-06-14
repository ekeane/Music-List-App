class AddUser < ActiveRecord::Migration

  def change
  	create_table :votes do |t|
  		t.references :users
  		t.references :songs
  		t.string :upvote
  		t.string :downvote
  		t.timestamps   
  	end 
  end
end