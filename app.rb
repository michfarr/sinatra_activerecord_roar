# frozen_string_literal: true
require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/activerecord'
require 'roar/json/hal'
require 'roar/hypermedia'

require './models/init'
require './representers/init'

# Document Class
class MyApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :database, adapter: 'sqlite3', database: 'blendle_db.sqlite3'

  get '/' do
    content_type 'application/json'
    { message: 'This page definitely loaded' }.to_json
  end

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
  put '/artists/:name' do
  end

  # DELETE
  delete '/artists/:name' do
  end

  get '/albums' do
    @albums = Album.all.extend(AlbumsRepresenter)
    @albums.to_json
  end

  get '/albums/:title' do
    @album = Album.find_by_title(params[:title]).extend(AlbumRepresenter)
    @album.to_json
  end

  post '/albums' do
  end

  put '/albums/:title' do
  end

  delete 'albums/:title' do
  end

  get '/songs' do
    @songs = Song.all.extend(SongsRepresenter)
    @songs.to_json
  end

  get '/songs/:track' do
    @song = Song.find_by_track(params[:track]).extend(SongRepresenter)
    @song.to_json
  end

  post '/songs' do
  end

  put '/songs/:track' do
  end

  delete '/songs/:track' do
  end
end
