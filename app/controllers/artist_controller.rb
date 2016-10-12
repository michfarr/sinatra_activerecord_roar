# frozen_string_literal: true
class MyApp
  # INDEX
  get '/artists' do
    content_type 'application/hal+json'

    @artists = Artist.all
    halt 404 if @artists.nil?
    @artists.extend(ArtistsRepresenter)

    status 200
    @artists.to_json
  end

  # SHOW
  get '/artists/:id' do
    content_type 'application/hal+json'

    @artist = Artist.find_by_id(params[:id])
    halt 404 if @artist.nil?
    @artist.extend(ArtistRepresenter)

    status 200
    @artist.to_json
  end

  # POST
  post '/artists' do
    content_type :json

    request.body.rewind
    post_params = JSON.parse(request.body.read.to_s)

    @artist = Artist.new(post_params)

    status 201 if @artist.save
  end

  # UPDATE
  put '/artists/:id' do
    content_type :json

    @artist = Artist.find_by_id(params[:id])
    request.body.rewind
    put_params = JSON.parse(request.body.read.to_s)

    @artist.update(put_params)

    @artist.save ? @artist.to_json : (halt 500)
  end

  # DELETE
  delete '/artists/:id' do
    @artist = Artist.find_by_id(params[:id])

    status 200 if @artist.destroy
  end
end
