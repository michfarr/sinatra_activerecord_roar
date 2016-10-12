# frozen_string_literal: true
class Album < ActiveRecord::Base
  belongs_to :artist

  has_many :songs, dependent: :destroy

  validates :title, presence: true,
                    length: { minimum: 3 }
end
