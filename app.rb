require 'sinatra/base'

class App < Sinatra::Application
  get '/' do
    erb :welcome_page
  end

  get '/home' do
    erb :home_page
  end
end