# frozen_string_literal: true
class MyApp
  # INDEX
  get '/artists/:artist_id/albums/:album_id/songs' do
    content_type 'application/hal+json'

    @songs = Song.all.where('artist_id = ? AND album_id = ?',
                            params[:artist_id], params[:album_id])
    halt 404 if @songs.nil?
    @songs.extend(SongsRepresenter)

    status 200
    @songs.to_json
  end

  # SHOW
  get '/artists/:artist_id/albums/:album_id/songs/:id' do
    content_type 'application/hal+json'

    @song = Song.where('artist_id = ? AND album_id = ?',
                       params[:artist_id],
                       params[:album_id]).find_by_id(params[:id])
    halt 404 if @song.nil?
    @song.extend(SongRepresenter)

    status 200
    @song.to_json
  end

  # CREATE
  post '/artists/:artist_id/albums/:album_id/songs' do
    content_type :json

    request.body.rewind
    post_params = JSON.parse(request.body.read.to_s)

    post_params['artist_id'] = params[:artist_id]
    post_params['album_id'] = params[:album_id]

    @song = Song.new(post_params)

    status 201 if @song.save
  end

  # UPDATE
  put '/artists/:artist_id/albums/:album_id/songs/:id' do
    content_type :json

    request.body.rewind
    put_params = JSON.parse(request.body.read.to_s)

    @song = Song.where('artist_id = ? AND album_id = ?',
                       params[:artist_id],
                       params[:album_id]).find_by_id(params[:id])
    halt 404 if @song.nil?

    @song.update(put_params)

    @song.save ? @song.to_json : (halt 500)
  end

  # DELETE
  delete '/artists/:artist_id/albums/:album_id/songs/:id' do
    @song = Song.where(artist_id: params[:artist_id],
                       album_id: params[:album_id]).find_by_id(params[:id])

    status 200 if @song.destroy
  end
end
