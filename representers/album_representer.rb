module AlbumRepresenter
  include Roar::JSON::HAL

  property :id
  property :title

  collection :songs, class: Song, embedded: true do
    property :id
    property :track
    property :track_time
  end

  link :self do
    "http://albums/#{id}"
  end
end

module AlbumsRepresenter
  include Representable::JSON::Collection

  items extend: AlbumRepresenter, class:Album
end
