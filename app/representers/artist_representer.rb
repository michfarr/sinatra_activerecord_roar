# frozen_string_literal: true
module ArtistRepresenter
  include Roar::JSON::HAL

  link :self do
    "/artists/#{id}"
  end

  collection :albums, class: Album, embedded: true do
    property :id
    property :title
    property :release_year
    property :duration
  end

  property :id
  property :name
  property :history
end

module ArtistsRepresenter
  include Representable::JSON::Collection

  items extend: ArtistRepresenter, class: Artist
end
