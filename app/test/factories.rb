# frozen_string_literal: true
FactoryGirl.define do
  factory :artist do
    sequence(:name) { |n| "Artist #{n}" }
    history         'The (king|queen) of In-credulites'
  end

  factory :album do
    sequence(:title) { |n| "Album #{n}" }
    duration         100
    release_year     1000
    description      'Such an album, just incredible'
    artist_id        1
  end

  factory :song do
    sequence(:track) { |n| "Song #{n}" }
    track_time       100
    artist_id        1
    album_id         1
  end
end
