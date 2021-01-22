# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :manga_categories
  has_many :mangas, through: :manga_categories

  validates :name, presence: true
end
