require 'sinatra/base'
require_relative './models/link.rb'

class BookmarkManager < Sinatra::Base

get '/links' do
  @links = Link.all
  erb :index
end



run! if app_file == $0
end
