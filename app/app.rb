ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

get '/links' do
   @links = Link.all
   erb :index
end

get '/links/new' do
  erb :addlink
end

post '/links' do
  link = Link.new(url: params[:url],
                  title: params[:title])
  tag = Tag.first_or_create(name: params[:tags])
  link.tags << tag
  link.save
  redirect to ('/links')
end

get '/tags/:name' do
  tag = Tag.first(name: params[:name])
  @links = tag ? tag.links : []
  erb :index
end

run! if app_file == $0
end
