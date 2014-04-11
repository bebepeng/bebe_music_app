require 'sinatra/base'
require './lib/song_list'
require './lib/youtube_validator'

SONGDATA = SongList.new(DB)

class App < Sinatra::Application

  enable :sessions

  get '/' do
    erb :welcome_page
  end

  get '/home' do
    erb :home_page, :locals => {:song_data => SONGDATA.all}
  end

  get '/add_song' do
    erb :new_song_form, :locals => {:title => nil, :artist => nil, :language => nil, :album => nil, :youtube => nil}
  end

  get '/home/:id' do
    id = params[:id]
    erb :edit_song_form, :locals => {:id => id, :title => SONGDATA.get_title(id), :artist => SONGDATA.get_artist(id), :language => SONGDATA.get_language(id), :album => SONGDATA.get_album(id), :youtube => SONGDATA.get_youtube(id)}
  end

  post '/add_song' do
    you_link = params[:youtube]
    if YoutubeValidator.valid?(you_link) || you_link.empty?
      you_link = YoutubeValidator.make_useable(you_link)
      SONGDATA.add(params[:artist], params[:title], params[:language], params[:album], you_link)
      redirect '/home'
    else
      session[:you_error] = 'Please Enter a Valid Youtube Link'
      erb :new_song_form, :locals => {:artist => params[:artist],:title => params[:title],:language => params[:language], :album => params[:album],:youtube => you_link}
    end
  end

  post '/home/:id' do
    you_link = params[:youtube]
    if YoutubeValidator.valid?(you_link) || you_link.empty?
      you_link = YoutubeValidator.make_useable(you_link)
      SONGDATA.edit(params[:id], {:title => params[:title], :artist => params[:artist], :language => params[:language], :album => params[:album], :youtube => you_link})
      redirect '/home'
    else
      session[:you_error] = 'Please Enter a Valid Youtube Link'
      erb :edit_song_form, :locals => {:id => params[:id], :title => params[:title], :artist => params[:artist], :language => params[:language], :album => params[:album], :youtube => you_link}
    end
  end
end