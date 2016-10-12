# frozen_string_literal: true
module SongRepresenter
  include Roar::JSON::HAL

  link :self do
    "/songs/#{id}"
  end

  property :id
  property :track
  property :track_time
end

module SongsRepresenter
  include Representable::JSON::Collection

  items extend: SongRepresenter, class: Song
end
