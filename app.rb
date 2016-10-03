require 'sinatra/base'
require 'sinatra/activerecord'
require 'roar/json/hal'

require './models'
require './representers'

# Class definition
class MyApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :database, adapter: 'sqlite3', database: 'blendle_db.sqlite3'

  # INDEX action
  get '/artists' do
    # Display all the products
    @artists = Artist.all
    p @artists
  end

  # SHOW action
  get '/artists/:id' do
    # Display a single product
    @artist = Artist.find_by_id(params[:id])
    puts @artist
  end

  # POST action
  post '/artists' do
    # Create a new product
  end

  # EDIT action
  get '/artists/:id/edit' do
    # Get details on an existing product
  end

  put '/artists/:id' do
    # And then edit it
  end

  run! if app_file == $PROGRAM_NAME
end
