require 'sinatra/base'

class App < Sinatra::Application
  get '/' do
    erb :welcome_page
  end
end