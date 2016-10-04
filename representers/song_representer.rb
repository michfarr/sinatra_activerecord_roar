module SongRepresenter
  include Roar::JSON::HAL

  property :id
  property :track

  link :self do
    "/songs/#{id}"
  end
end

module SongsRepresenter
  include Representable::JSON::Collection

  items extend: SongRepresenter, class: Song
end
