class AddSongs < ActiveRecord::Migration

  def change
  	create_table :songs do |t|
  		t.references :users
  		t.string :title
  		t.string :author
  		t.string :content
  		t.timestamps   
  	end 
  end
end