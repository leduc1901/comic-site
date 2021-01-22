# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :manga
  validates :content, presence: true, length: { minimum: 5, maximum: 100 }
  validates :manga_id, presence: true
end
