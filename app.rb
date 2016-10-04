##### ###### ######
# app.rb
#
require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/activerecord'
require 'roar/json/hal'
require 'roar/hypermedia'

# require './models/artist'
# require './models/album'
# require './models/song'

# require './representers/artist'
# require './representers/album'
# require './representers/song'

require './models/init'
require './representers/init'
# require './controllers/init'

# Class definition
class MyApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :database, adapter: 'sqlite3', database: 'blendle_db.sqlite3'

  ### ### ###
  # Artists
  #
  # INDEX
  get '/artists' do
    # Display all the products
    @artists = Artist.all.extend(ArtistsRepresenter)
    @artists.to_json
  end

  # SHOW
  get '/artists/:name' do
    # Display a single product
    @artist = Artist.find_by_name(params[:name]).extend(ArtistRepresenter)
    @artist.to_json
  end

  # POST
  post '/artists' do
    # Create a new product
  end

  # EDIT
  put '/artists/:id' do
    # And then edit it
  end

  # DELETE
  delete '/artists/:id' do
  end

  ### ### ###
  # Albums
  #
  get '/albums' do
    @albums = Album.all.extend(AlbumsRepresenter)
    @albums.to_json
  end

  get '/albums/:id' do
    @album = Album.find_by_id(params[:id]).extend(AlbumRepresenter)
    @album.to_json
  end

  post '/albums' do
  end

  put '/albums/:id' do
  end

  delete 'albums/:id' do
  end

  ### ### ###
  # Songs
  #
  get '/songs' do
    @songs = Song.all.extend(SongsRepresenter)
    @songs.to_json
  end

  get '/songs/:id' do
    @song = Song.find_by_id(params[:id]).extend(SongRepresenter)
    @song.to_json
  end

  post '/songs' do
  end

  put '/songs/:id' do
  end

  delete '/songs/:id' do
  end
end
