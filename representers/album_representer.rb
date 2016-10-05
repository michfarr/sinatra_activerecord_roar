# frozen_string_literal: true
module AlbumRepresenter
  include Roar::JSON::HAL

  link :self do
    "http://albums/#{title}"
  end

  collection :songs, class: Song, embedded: true do
    property :id
    property :track
    property :track_time
  end

  property :id
  property :title
end

module AlbumsRepresenter
  include Representable::JSON::Collection

  items extend: AlbumRepresenter, class: Album
end
