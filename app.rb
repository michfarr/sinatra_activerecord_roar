require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/activerecord'
require 'roar/json/hal'
require 'roar/hypermedia'

require './models/init'
require './representers/init'

class MyApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :database, adapter: 'sqlite3', database: 'blendle_db.sqlite3'

 # INDEX
  get '/artists' do
    @artists = Artist.all.extend(ArtistsRepresenter)
    @artists.to_json
  end

  # SHOW
  get '/artists/:name' do
    @artist = Artist.find_by_name(params[:name]).extend(ArtistRepresenter)
    @artist.to_json
  end

  # POST
  post '/artists' do
  end

  # EDIT
  put '/artists/:id' do
  end

  # DELETE
  delete '/artists/:id' do
  end

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
