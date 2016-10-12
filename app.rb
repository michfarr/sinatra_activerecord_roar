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

  configure :development, :test do
    require 'logger'
    set :logging, Logger::DEBUG
    set :database, adapter: 'sqlite3', database: 'blendle_db.sqlite3'
  end

  configure do
    set :database_file, 'config/database.yml'
    set :server, :puma
  end

  before do
    headers 'Access-Control-Allow-Methods' => %w(OPTIONS GET POST PUT DELETE),
            'Accept' => %(application/json)
  end
end

require './controllers/init'

class MyApp
  # ROOT
  get '/' do
    content_type 'application/json'

    status 200
    { message: 'This page definitely loaded' }.to_json
  end
end

MyApp.run! if __FILE__ == $PROGRAM_NAME
