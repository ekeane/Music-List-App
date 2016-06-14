# Homepage (Root path)
get '/' do
  @songs = Song.all
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end

post '/songs' do

  @song = Song.new(
    title: params[:title],
    author: params[:author],
    content: params[:content]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end


  
  
end