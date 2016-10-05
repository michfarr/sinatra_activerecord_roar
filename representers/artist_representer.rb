# frozen_string_literal: true
module ArtistRepresenter
  include Roar::JSON::HAL

  link :self do
    "/artists/#{name}"
  end

  collection :albums, class: Album, embedded: true do
    property :title
    property :release_year
    property :duration
  end

  property :id
  property :name
end

module ArtistsRepresenter
  include Representable::JSON::Collection

  items extend: ArtistRepresenter, class: Artist
end
