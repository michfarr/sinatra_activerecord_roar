# frozen_string_literal: true
class MyApp
  # INDEX
  get '/artists/:artist_id/albums' do
    content_type 'application/hal+json'

    @albums = Album.all.where(artist_id: params[:artist_id])
    halt 404 if @albums.nil?
    @albums.extend(AlbumsRepresenter)

    status 200
    @albums.to_json
  end

  # SHOW
  get '/artists/:artist_id/albums/:id' do
    content_type 'application/hal+json'

    @album = Album.where(artist_id: params[:artist_id]).find_by_id(params[:id])
    halt 404 if @album.nil?
    @album.extend(AlbumRepresenter)

    status 200
    @album.to_json
  end

  # CREATE
  post '/artists/:artist_id/albums' do
    content_type :json

    request.body.rewind
    post_params = JSON.parse(request.body.read.to_s)

    post_params['artist_id'] = params[:artist_id]

    @album = Album.new(post_params)

    status 201 if @album.save
  end

  # UPDATE
  put '/artists/:artist_id/albums/:id' do
    content_type :json

    request.body.rewind
    put_params = JSON.parse(request.body.read.to_s)

    @album = Album.where(artist_id: params[:artist_id]).find_by_id(params[:id])
    halt 404 if @album.nil?

    @album.update(put_params)

    @album.save ? @album.to_json : (halt 500)
  end

  # DELETE
  delete '/artists/:artist_id/albums/:id' do
    @album = Album.where(artist_id: params[:artist_id]).find_by_id(params[:id])
    halt 404 if @album.nil?

    status 200 if @album.destroy
  end
end
