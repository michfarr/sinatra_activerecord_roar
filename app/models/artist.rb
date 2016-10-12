# frozen_string_literal: true
class Artist < ActiveRecord::Base
  has_many :albums, dependent: :destroy
  has_many :songs, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: true,
                   length: { minimum: 3 }
end
