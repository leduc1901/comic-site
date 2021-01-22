# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :mangas

  validates :name, presence: true
end
