# frozen_string_literal: true
module SongRepresenter
  include Roar::JSON::HAL

  link :self do
    "/songs/#{title}"
  end

  property :id
  property :track
end

module SongsRepresenter
  include Representable::JSON::Collection

  items extend: SongRepresenter, class: Song
end
