# frozen_string_literal: true

class MangaCategory < ApplicationRecord
  belongs_to :manga
  belongs_to :category

  validates :manga_id, presence: true
  validates :category_id, presence: true
  validates_uniqueness_of :manga_id, scope: :category_id
end
