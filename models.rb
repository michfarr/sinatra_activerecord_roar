class Artist < ActiveRecord::Base
  has_many :albums, dependent: :destroy
  has_many :songs, dependent: :destroy
end

class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :songs, dependent: :destroy
end

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :album
end
