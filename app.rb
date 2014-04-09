require 'sinatra/base'
require './lib/song_list'

SONGDATA = SongList.new(DB)

class App < Sinatra::Application
  get '/' do
    erb :welcome_page
  end

  get '/home' do
    erb :home_page, :locals => {:song_data => SONGDATA.all}
  end

  get '/add_song' do
    erb :new_song_form
  end

  post '/home' do
    SONGDATA.add(params[:title], params[:artist], params[:language])
    redirect '/home'
  end
end