module ArtistRepresenter
  include Roar::JSON::HAL

  property :id
  property :name

  collection :albums, class: Album, embedded: true do
    property :title
    property :release_year
    property :duration
  end

  link :self do
    "/artists/#{id}"
  end
end

module ArtistsRepresenter
  include Representable::JSON::Collection

  items extend: ArtistRepresenter, class: Artist
end
