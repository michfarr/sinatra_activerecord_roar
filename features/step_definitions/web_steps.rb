# frozen_string_literal: true
Given /^there (?:is|are) (\d+) (\w+)$/ do |total, model|
  # Check to see if table exists
  begin
    case model
    when /Albums?/i
      create_list(:album, total.to_i)
      expect(Album.count).to eq(total.to_i)
    when /Artists?/i
      create_list(:artist, total.to_i)
      expect(Artist.count).to eq(total.to_i)
    when /Songs?/i
      create_list(:song, total.to_i)
      expect(Song.count).to eq(total.to_i)
    end
  rescue ActiveRecord::StatementInvalid
    puts 'Insure the database migration has been completed with the command "RACK_ENV=\'test\' rake db:migrate"'.colorize(:blue)
  end
end

When /^a user views all (\w+)$/ do |model|
  case model
  when /Albums?/i
    album = Album.first
    get "/artists/#{album[:artist_id]}/albums"
  when /Artists?/i
    get '/artists'
  when /Songs?/i
    song = Song.first
    get "/artists/#{song[:artist_id]}/albums/#{song[:album_id]}/songs"
  end
end

And /^the response status is (\d+)$/ do |status_code|
  expect(last_response.status).to eq(status_code.to_i)
end

When /^a user views a single (\w+)$/ do |model|
  case model
  when /Albums?/i
    album = Album.first
    get "/artists/#{album[:artist_id]}/albums/#{album[:id]}"
  when /Artists?/i
    artist = Artist.first
    get "/artists/#{artist.id}"
  when /Songs?/i
    song = Song.first
    get "/artists/#{song[:artist_id]}/albums/#{song[:album_id]}/songs/#{song[:id]}"
  end
end

When /^a user attempts to add an? (\w+)$/ do |model|
  case model
  when /Albums?/i
    @original_count = Album.count.to_i
    album = attributes_for(:album).to_h

    post "/artists/#{album[:artist_id]}/albums", album.to_json
  when /Artists?/i
    @original_count = Artist.count.to_i
    artist = attributes_for(:artist).to_h

    post '/artists', artist.to_json
  when /Songs?/i
    @original_count = Song.count.to_i
    song = attributes_for(:song).to_h

    post "/artists/#{song[:artist_id]}/albums/#{song[:album_id]}/songs",
         song.to_json
  end
end

Then /^(\d+) (\w+) (?:is|are) created$/ do |total_created, model|
  case model
  when /Albums?/i
    expect(Album.count).to eq(@original_count + total_created.to_i)
  when /Artists?/i
    expect(Artist.count).to eq(@original_count + total_created.to_i)
  when /Songs?/i
    expect(Song.count).to eq(@original_count + total_created.to_i)
  end
end

When /^a user attempts to update the first (\w+)$/ do |model|
  case model
  when /Albums?/i
    @original_album = Album.first
    artist_id = @original_album[:artist_id]

    put_params = { 'title': 'This is the new title' }

    put "/artists/#{artist_id}/albums/#{@original_album.id}", put_params.to_json
  when /Artists?/i
    @original_artist = Artist.first

    put_params = { 'name': 'New artist name' }

    put "/artists/#{@original_artist.id}", put_params.to_json
  when /Songs?/i
    @original_song = Song.first
    artist_id = @original_song.artist_id
    album_id = @original_song.album_id

    put_params = { 'track': 'This is the new track' }

    put "/artists/#{artist_id}/albums/#{album_id}/songs/#{@original_song.id}",
        put_params.to_json
  end
end

Then /^the first (\w+) (?:is|are) updated$/ do |model|
  case model
  when /Albums?/i
    album = Album.first
    expect(album.title).not_to eq(@original_album.title)
  when /Artists?/i
    artist = Artist.first
    expect(artist.name).not_to eq(@original_artist.name)
  when /Songs?/i
    song = Song.first
    expect(song.track).not_to eq(@original_song.track)
  end
end

When /^a user attempts to delete the first (\w+)$/ do |model|
  case model
  when /Albums?/i
    @original_count = Album.count.to_i
    album = Album.first

    delete "artists/#{album.id}/albums/#{album.id}"
  when /Artists?/i
    @original_count = Artist.count.to_i
    to_delete = Artist.first

    delete "artists/#{to_delete[:id]}"
  when /Songs?/i
    @original_count = Song.count.to_i
    song = Song.first
    artist_id = song.artist_id
    album_id = song.album_id

    delete "artists/#{artist_id}/albums/#{album_id}/songs/#{song.id}"
  end
end

Then /^(\d+) (\w+) (?:is|are) removed$/ do |total_removed, model|
  case model
  when /Albums?/i
    expect(Album.count).to eq(@original_count - total_removed.to_i)
  when /Artists?/i
    expect(Artist.count).to eq(@original_count - total_removed.to_i)
  when /Songs?/i
    expect(Song.count).to eq(@original_count - total_removed.to_i)
  end
end

And /^there (?:is|are) now (\d+) (\w+)$/ do |current_total, model|
  case model
  when /Albums?/i
    expect(Album.count).to eq(current_total.to_i)
  when /Artists?/i
    expect(Artist.count).to eq(current_total.to_i)
  when /Songs?/i
    expect(Song.count).to eq(current_total.to_i)
  end
end
