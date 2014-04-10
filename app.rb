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

  get '/home/:id' do
    id = params[:id]
    erb :edit_song_form, :locals => {:id => id, :title => SONGDATA.get_title(id), :artist => SONGDATA.get_artist(id), :language => SONGDATA.get_language(id), :album => SONGDATA.get_album(id), :youtube => SONGDATA.get_youtube(id)}
  end

  post '/home' do
    SONGDATA.add(params[:artist], params[:title], params[:language], params[:album], params[:youtube])
    redirect '/home'
  end

  post '/home/:id' do
    SONGDATA.edit(params[:id], {:title => params[:title], :artist => params[:artist], :language => params[:language], :album => params[:album], :youtube => params[:youtube]})
    redirect '/home'
  end
end