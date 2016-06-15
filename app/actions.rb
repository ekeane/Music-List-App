

# Homepage (Root path)
get '/' do
  @songs = Song.all
  erb :index
end

#--------for song posting-----------#

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





before do
  @current_user = User.find(session[:user_id]) if session[:user_id]
  cookies[:page_views] ? cookies[:page_views] = cookies[:page_views].to_i + 1 : cookies[:page_views] = 1
end

  
  #---------for login---------#


  get '/users/login' do
    erb :'users/login'
  end

  post '/users/login' do
    user = User.find_by(email: params[:email])
    if user && user.password == params[:password]  
      session[:user_id] = user.id
      redirect '/'
    else
      redirect "/"
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


